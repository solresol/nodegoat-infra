#!/usr/bin/env python3
"""Convert MySQL SQL files to PostgreSQL syntax."""

import re
import sys

def convert_mysql_to_postgres(input_file, output_file):
    with open(input_file, 'r') as f:
        content = f.read()

    # Convert MySQL escaped quotes to PostgreSQL style
    # MySQL: \'  PostgreSQL: ''
    content = content.replace("\\'", "''")

    # Basic type replacements
    replacements = [
        (r'`', ''),
        (r'ENGINE=InnoDB[^;]*', ''),
        (r'ENGINE=MEMORY[^;]*', ''),
        (r'ENGINE=MyISAM[^;]*', ''),
        (r'\) ENGINE=[A-Za-z]+\s*;', ');'),
        (r'DEFAULT CHARSET=utf8mb4[^,;)]*', ''),
        (r'CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci', ''),
        (r'COLLATE utf8mb4_unicode_ci', ''),
        (r'CHARACTER SET utf8mb4', ''),
        (r'tinyint\(1\)', 'SMALLINT'),
        (r'tinyint', 'SMALLINT'),
        (r'smallint', 'SMALLINT'),
        (r'mediumint', 'INTEGER'),
        (r'bigint', 'BIGINT'),
        (r'longtext', 'TEXT'),
        (r'mediumtext', 'TEXT'),
        (r'longblob', 'BYTEA'),
        (r'mediumblob', 'BYTEA'),
        (r'\bblob\b', 'BYTEA'),
        (r'\bbinary\b', 'BYTEA'),
        (r'datetime', 'TIMESTAMP'),
        (r'varbinary\(\d+\)', 'BYTEA'),
        (r'double', 'DOUBLE PRECISION'),
        (r'\bfloat\b', 'REAL'),
        (r' unsigned', ''),
        (r' UNSIGNED', ''),
        (r'int NOT NULL AUTO_INCREMENT', 'SERIAL'),
        (r'int NOT NULL', 'INTEGER NOT NULL'),
        (r'int DEFAULT', 'INTEGER DEFAULT'),
        (r' USING BTREE', ''),
        (r' USING HASH', ''),
    ]

    for pattern, replacement in replacements:
        content = re.sub(pattern, replacement, content)

    # Process ALTER TABLE statements
    lines = content.split('\n')
    output_lines = []
    i = 0

    while i < len(lines):
        line = lines[i]

        # Check for ALTER TABLE
        alter_match = re.match(r'^ALTER TABLE\s+(\w+)\s*$', line)
        if alter_match:
            table_name = alter_match.group(1)
            alter_block = [line]
            i += 1

            # Collect the entire ALTER TABLE block
            while i < len(lines) and not lines[i-1].rstrip().endswith(';'):
                alter_block.append(lines[i])
                i += 1

            block_text = '\n'.join(alter_block)

            # Skip MODIFY statements (AUTO_INCREMENT handled by SERIAL)
            if 'MODIFY' in block_text:
                continue

            # Convert ADD KEY to CREATE INDEX
            key_match = re.search(r'ADD KEY\s+(\w+)\s+\(([^)]+)\)', block_text)
            if key_match:
                key_name = key_match.group(1)
                columns = key_match.group(2)
                output_lines.append(f'CREATE INDEX idx_{table_name}_{key_name} ON {table_name} ({columns});')
                continue

            # Convert ADD UNIQUE KEY to CREATE UNIQUE INDEX
            unique_match = re.search(r'ADD UNIQUE KEY\s+(\w+)\s+\(([^)]+)\)', block_text)
            if unique_match:
                key_name = unique_match.group(1)
                columns = unique_match.group(2)
                output_lines.append(f'CREATE UNIQUE INDEX idx_{table_name}_{key_name} ON {table_name} ({columns});')
                continue

            # Keep other ALTER TABLE statements
            output_lines.append(block_text)
        else:
            output_lines.append(line)
            i += 1

    # Handle multiple KEY statements in single ALTER TABLE
    # Re-process to catch any we missed
    final_content = '\n'.join(output_lines)

    # Clean up multiple consecutive empty lines
    final_content = re.sub(r'\n{3,}', '\n\n', final_content)

    with open(output_file, 'w') as f:
        f.write(final_content)

    print(f"Converted: {output_file}")

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Usage: convert-mysql-to-postgres.py <input.sql> <output.sql>")
        sys.exit(1)

    convert_mysql_to_postgres(sys.argv[1], sys.argv[2])
