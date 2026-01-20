DROP TABLE IF EXISTS user_details;

CREATE TABLE user_details (
  user_id INTEGER NOT NULL,
  clearance SMALLINT NOT NULL
) ;

ALTER TABLE user_details
  ADD PRIMARY KEY (user_id);
