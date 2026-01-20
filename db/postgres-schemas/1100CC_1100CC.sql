CREATE TABLE core_labels (
  identifier varchar(150)  NOT NULL,
  lang_code varchar(10)  NOT NULL,
  label TEXT  NOT NULL
) ;

CREATE TABLE core_language (
  lang_code varchar(10)  NOT NULL DEFAULT '',
  label varchar(150)  NOT NULL DEFAULT ''
) ;

CREATE TABLE core_users (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  uname varchar(100)  NOT NULL,
  email varchar(100)  NOT NULL,
  img varchar(255)  NOT NULL,
  biography TEXT  NOT NULL,
  passhash varchar(255)  NOT NULL,
  lang_code varchar(10)  NOT NULL,
  last_login TIMESTAMP DEFAULT NULL,
  ip BYTEA DEFAULT NULL,
  ip_proxy BYTEA DEFAULT NULL,
  labeler SMALLINT NOT NULL
) ;

CREATE TABLE def_var_countries (
  id INTEGER NOT NULL,
  code varchar(2)  NOT NULL,
  name varchar(255)  NOT NULL
) ;

ALTER TABLE core_labels
  ADD PRIMARY KEY (identifier,lang_code);

ALTER TABLE core_language
  ADD PRIMARY KEY (lang_code);

ALTER TABLE core_users
  ADD PRIMARY KEY (id);

ALTER TABLE def_var_countries
  ADD PRIMARY KEY (id);

