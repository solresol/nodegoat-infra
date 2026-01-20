#!/bin/bash
# Convert MySQL SQL files to PostgreSQL syntax

set -e

INPUT_FILE="$1"
OUTPUT_FILE="$2"

if [ -z "$INPUT_FILE" ] || [ -z "$OUTPUT_FILE" ]; then
    echo "Usage: $0 <input.sql> <output.sql>"
    exit 1
fi

echo "Converting $INPUT_FILE to PostgreSQL syntax..."

# Create temp files for multi-pass processing
TEMP_FILE=$(mktemp)
TEMP_FILE2=$(mktemp)
TEMP_FILE3=$(mktemp)

# First pass: basic type and syntax replacements
sed -e "s/\`//g" \
    -e "s/ENGINE=InnoDB[^;]*//g" \
    -e "s/DEFAULT CHARSET=utf8mb4[^,;)]*//g" \
    -e "s/CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci//g" \
    -e "s/COLLATE utf8mb4_unicode_ci//g" \
    -e "s/CHARACTER SET utf8mb4//g" \
    -e "s/tinyint(1)/SMALLINT/g" \
    -e "s/tinyint/SMALLINT/g" \
    -e "s/smallint/SMALLINT/g" \
    -e "s/mediumint/INTEGER/g" \
    -e "s/bigint/BIGINT/g" \
    -e "s/longtext/TEXT/g" \
    -e "s/mediumtext/TEXT/g" \
    -e "s/longblob/BYTEA/g" \
    -e "s/mediumblob/BYTEA/g" \
    -e "s/blob/BYTEA/g" \
    -e "s/datetime/TIMESTAMP/g" \
    -e "s/varbinary([0-9]*)/BYTEA/g" \
    -e "s/double/DOUBLE PRECISION/g" \
    -e "s/float/REAL/g" \
    -e "s/ unsigned//g" \
    -e "s/ UNSIGNED//g" \
    -e "s/int NOT NULL AUTO_INCREMENT/SERIAL/g" \
    -e "s/int NOT NULL/INTEGER NOT NULL/g" \
    -e "s/int DEFAULT/INTEGER DEFAULT/g" \
    -e "s/ USING BTREE//g" \
    -e "s/ USING HASH//g" \
    "$INPUT_FILE" > "$TEMP_FILE"

# Second pass: Convert ALTER TABLE with KEY/UNIQUE KEY to CREATE INDEX
# and handle MODIFY statements
awk '
BEGIN {
    current_table = ""
    in_alter = 0
    buffer = ""
}

/^ALTER TABLE [a-zA-Z_]+$/ {
    # Single line ALTER TABLE (table name only)
    current_table = $3
    in_alter = 1
    buffer = $0
    next
}

/^ALTER TABLE [a-zA-Z_]+ *$/ {
    # ALTER TABLE with trailing space
    current_table = $3
    in_alter = 1
    buffer = $0
    next
}

in_alter == 1 {
    buffer = buffer "\n" $0

    if (/;$/) {
        # End of ALTER TABLE block
        if (buffer ~ /MODIFY/) {
            # Skip MODIFY statements (for AUTO_INCREMENT)
        } else if (buffer ~ /ADD KEY/) {
            # Convert ADD KEY to CREATE INDEX
            # Extract key name and columns
            match(buffer, /ADD KEY ([a-zA-Z_]+) \(([^)]+)\)/, arr)
            if (arr[1] != "" && arr[2] != "") {
                print "CREATE INDEX idx_" current_table "_" arr[1] " ON " current_table " (" arr[2] ");"
            }
        } else if (buffer ~ /ADD UNIQUE KEY/) {
            # Convert ADD UNIQUE KEY to CREATE UNIQUE INDEX
            match(buffer, /ADD UNIQUE KEY ([a-zA-Z_]+) \(([^)]+)\)/, arr)
            if (arr[1] != "" && arr[2] != "") {
                print "CREATE UNIQUE INDEX idx_" current_table "_" arr[1] " ON " current_table " (" arr[2] ");"
            }
        } else {
            # Other ALTER TABLE statements - keep them
            print buffer
        }
        buffer = ""
        in_alter = 0
        current_table = ""
    }
    next
}

{ print }
' "$TEMP_FILE" > "$TEMP_FILE2"

# Third pass: Handle inline KEY definitions in CREATE TABLE
# and clean up any remaining issues
sed -e 's/,$/,/g' \
    -e 's/  */ /g' \
    "$TEMP_FILE2" > "$TEMP_FILE3"

# Final cleanup: remove consecutive empty lines
cat -s "$TEMP_FILE3" > "$OUTPUT_FILE"

# Clean up temp files
rm -f "$TEMP_FILE" "$TEMP_FILE2" "$TEMP_FILE3"

echo "Converted: $OUTPUT_FILE"
