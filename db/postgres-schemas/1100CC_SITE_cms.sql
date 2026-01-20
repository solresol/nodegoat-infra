CREATE TABLE cms_dashboard_widgets (
  user_id INTEGER NOT NULL,
  module varchar(50)  NOT NULL,
  method varchar(50)  NOT NULL,
  x SMALLINT NOT NULL,
  y SMALLINT NOT NULL,
  min SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE cms_labels (
  identifier varchar(150)  NOT NULL,
  lang_code varchar(10)  NOT NULL,
  label TEXT  NOT NULL
) ;

CREATE TABLE cms_language (
  lang_code varchar(10)  NOT NULL DEFAULT '',
  label varchar(150)  NOT NULL DEFAULT '',
  host_canonical varchar(100)  NOT NULL,
  is_user_selectable SMALLINT NOT NULL,
  is_default SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE cms_language_hosts (
  host_name varchar(50)  NOT NULL,
  lang_code varchar(10)  NOT NULL
) ;

CREATE TABLE cms_users (
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

CREATE TABLE site_apis (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  clients_user_group_id INTEGER NOT NULL,
  client_users_user_group_id INTEGER NOT NULL,
  module varchar(50)  NOT NULL,
  request_limit_amount REAL NOT NULL,
  request_limit_unit INTEGER NOT NULL,
  request_limit_ip INTEGER NOT NULL,
  request_limit_global INTEGER NOT NULL,
  documentation_url varchar(255)  NOT NULL
) ;

CREATE TABLE site_api_clients (
  api_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id varchar(255)  NOT NULL,
  enabled SMALLINT NOT NULL DEFAULT '1',
  secret varchar(255)  NOT NULL,
  name varchar(255)  NOT NULL,
  request_limit_disable SMALLINT NOT NULL,
  time_amount INTEGER NOT NULL,
  time_unit INTEGER NOT NULL
) ;

CREATE TABLE site_api_client_users (
  client_id varchar(255)  NOT NULL,
  user_id INTEGER NOT NULL,
  enabled SMALLINT NOT NULL DEFAULT '1',
  token varchar(255)  NOT NULL,
  date TIMESTAMP NOT NULL,
  date_valid TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE site_api_hosts (
  api_id INTEGER NOT NULL,
  host_name varchar(255)  NOT NULL
) ;

CREATE TABLE site_details (
  unique_row SMALLINT NOT NULL DEFAULT '1',
  name varchar(100)  NOT NULL,
  address varchar(50)  NOT NULL,
  address_nr varchar(10)  NOT NULL,
  zipcode varchar(10)  NOT NULL,
  city varchar(50)  NOT NULL,
  country varchar(50)  NOT NULL,
  tel varchar(50)  NOT NULL,
  fax varchar(20)  NOT NULL,
  bank varchar(20)  NOT NULL,
  bank_nr varchar(34)  NOT NULL,
  email varchar(100)  NOT NULL,
  title varchar(255)  NOT NULL,
  description TEXT  NOT NULL,
  head_tags varchar(1000)  NOT NULL,
  html varchar(5000)  NOT NULL,
  email_header TEXT  NOT NULL,
  email_footer TEXT  NOT NULL,
  analytics_account varchar(20)  NOT NULL,
  facebook varchar(100)  NOT NULL,
  twitter varchar(100)  NOT NULL,
  youtube varchar(100)  NOT NULL,
  email_1100cc varchar(100)  NOT NULL,
  email_1100cc_host varchar(100)  NOT NULL,
  email_1100cc_password varchar(50)  NOT NULL,
  caching SMALLINT NOT NULL,
  caching_external SMALLINT NOT NULL,
  logging SMALLINT NOT NULL,
  throttle SMALLINT NOT NULL,
  https SMALLINT NOT NULL,
  show_system_errors SMALLINT NOT NULL,
  show_404 SMALLINT NOT NULL,
  use_servers SMALLINT NOT NULL
) ;

CREATE TABLE site_details_custom (
  name varchar(50)  NOT NULL,
  value varchar(255)  NOT NULL
) ;

CREATE TABLE site_details_hosts (
  name varchar(100)  NOT NULL
) ;

CREATE TABLE site_details_servers (
  host_name varchar(255)  NOT NULL,
  host_type varchar(30)  NOT NULL,
  host_port INTEGER NOT NULL,
  login_type varchar(30)  NOT NULL,
  login_name varchar(30)  NOT NULL,
  passkey varchar(2000)  NOT NULL,
  extra varchar(255)  NOT NULL,
  status SMALLINT DEFAULT NULL
) ;

CREATE TABLE site_directories (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  title varchar(100)  NOT NULL,
  root SMALLINT NOT NULL,
  page_index_id INTEGER DEFAULT NULL,
  user_group_id INTEGER NOT NULL,
  require_login SMALLINT NOT NULL,
  page_fallback_id INTEGER DEFAULT NULL,
  publish SMALLINT NOT NULL
) ;

CREATE TABLE site_directory_closure (
  ancestor_id INTEGER NOT NULL,
  descendant_id INTEGER NOT NULL,
  path_length INTEGER NOT NULL,
  sort SMALLINT DEFAULT NULL
) ;

CREATE TABLE site_jobs (
  module varchar(50)  NOT NULL,
  method varchar(50)  NOT NULL,
  options varchar(255)  NOT NULL,
  seconds INTEGER NOT NULL,
  date_executed timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  running SMALLINT NOT NULL DEFAULT '0',
  process_id INTEGER DEFAULT NULL,
  process_date TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE site_jobs_timer (
  unique_row SMALLINT NOT NULL DEFAULT '1',
  date TIMESTAMP NOT NULL,
  process_id INTEGER DEFAULT NULL
) ;

CREATE TABLE site_log (
  id INTEGER NOT NULL,
  label varchar(20)  NOT NULL,
  msg TEXT  NOT NULL,
  type varchar(20)  NOT NULL,
  debug TEXT  NOT NULL,
  date TIMESTAMP NOT NULL,
  log_user_id INTEGER NOT NULL
) ;

CREATE TABLE site_log_users (
  id INTEGER NOT NULL,
  user_id INTEGER NOT NULL DEFAULT '0',
  user_class SMALLINT NOT NULL,
  ip BYTEA NOT NULL,
  ip_proxy BYTEA NOT NULL,
  url varchar(255)  NOT NULL,
  referral_url varchar(500)  NOT NULL
) ;

CREATE TABLE site_pages (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  title varchar(100)  NOT NULL,
  directory_id INTEGER NOT NULL,
  template_id INTEGER NOT NULL,
  master_id INTEGER NOT NULL,
  url varchar(255)  NOT NULL,
  html TEXT  NOT NULL,
  script TEXT  NOT NULL,
  publish SMALLINT NOT NULL,
  clearance SMALLINT NOT NULL,
  sort SMALLINT DEFAULT NULL
) ;

CREATE TABLE site_page_internal_tags (
  page_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE TABLE site_page_modules (
  id INTEGER NOT NULL,
  page_id INTEGER NOT NULL,
  x SMALLINT NOT NULL,
  y SMALLINT NOT NULL,
  module varchar(30)  NOT NULL,
  var varchar(255)  NOT NULL,
  shortcut varchar(100)  NOT NULL,
  shortcut_root SMALLINT NOT NULL
) ;

CREATE TABLE site_page_templates (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  html TEXT  NOT NULL,
  html_raw TEXT  NOT NULL,
  css TEXT  NOT NULL,
  preview TEXT  NOT NULL,
  column_count varchar(150)  NOT NULL,
  row_count varchar(150)  NOT NULL,
  margin_back INTEGER NOT NULL,
  margin_mod INTEGER NOT NULL
) ;

CREATE TABLE site_tags (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL
) ;

CREATE TABLE site_uris (
  uri_translator_id INTEGER NOT NULL,
  in_out SMALLINT NOT NULL DEFAULT '1',
  identifier varchar(300)  NOT NULL,
  url varchar(1000)  NOT NULL,
  remark varchar(1000)  NOT NULL,
  service varchar(50)  DEFAULT NULL
) ;

CREATE TABLE site_uri_translators (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  mode SMALLINT NOT NULL DEFAULT '1',
  host_name varchar(100)  DEFAULT NULL,
  delay INTEGER NOT NULL,
  show_remark SMALLINT NOT NULL
) ;

CREATE TABLE site_uri_translator_hosts (
  uri_translator_id INTEGER NOT NULL,
  host_name varchar(255)  NOT NULL
) ;

CREATE TABLE site_user_groups (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  parent_id INTEGER NOT NULL
) ;

CREATE TABLE site_user_group_link (
  group_id INTEGER NOT NULL,
  from_table varchar(100)  NOT NULL,
  from_column varchar(50)  NOT NULL,
  to_table varchar(100)  NOT NULL,
  to_column varchar(50)  NOT NULL,
  get_column varchar(50)  NOT NULL,
  virtual_name varchar(50)  NOT NULL,
  multi_source SMALLINT NOT NULL,
  multi_target SMALLINT NOT NULL,
  view SMALLINT NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE users (
  id INTEGER NOT NULL,
  enabled SMALLINT NOT NULL DEFAULT '1',
  group_id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  uname varchar(100)  NOT NULL,
  email varchar(100)  NOT NULL,
  parent_id INTEGER NOT NULL,
  passhash varchar(255)  NOT NULL,
  lang_code varchar(10)  DEFAULT NULL,
  last_login TIMESTAMP DEFAULT NULL,
  ip BYTEA DEFAULT NULL,
  ip_proxy BYTEA DEFAULT NULL
) ;

CREATE TABLE user_account_key (
  user_id INTEGER NOT NULL,
  passkey varchar(50)  NOT NULL,
  email_new varchar(100)  DEFAULT NULL,
  date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

CREATE TABLE user_page_clearance (
  user_id INTEGER NOT NULL,
  page_id INTEGER NOT NULL
) ;

CREATE TABLE user_webservice_key (
  user_id INTEGER NOT NULL,
  passkey varchar(50)  NOT NULL,
  date_active timestamp NULL DEFAULT NULL
) ;
CREATE TABLE view_user_parent (
id int
,parent_group_id int
,parent_name varchar(50)
);
DROP TABLE IF EXISTS view_user_parent;

CREATE VIEW view_user_parent  AS SELECT u.id AS id, u.name AS parent_name, u.group_id AS parent_group_id FROM users AS u  ;

ALTER TABLE cms_dashboard_widgets
  ADD PRIMARY KEY (user_id,module,method);

ALTER TABLE cms_labels
  ADD PRIMARY KEY (identifier,lang_code);

ALTER TABLE cms_language
  ADD PRIMARY KEY (lang_code);

ALTER TABLE cms_language_hosts
  ADD PRIMARY KEY (host_name,lang_code);

ALTER TABLE cms_users
  ADD PRIMARY KEY (id);

ALTER TABLE site_apis
  ADD PRIMARY KEY (id);

CREATE INDEX idx_site_api_clients_api_id ON site_api_clients (api_id,user_id);

CREATE UNIQUE INDEX idx_site_api_client_users_token ON site_api_client_users (token);

ALTER TABLE site_api_hosts
  ADD PRIMARY KEY (host_name,api_id);

ALTER TABLE site_details
  ADD PRIMARY KEY (unique_row);

ALTER TABLE site_details_custom
  ADD PRIMARY KEY (name);

ALTER TABLE site_details_hosts
  ADD PRIMARY KEY (name);

CREATE INDEX idx_site_details_servers_status ON site_details_servers (status);

CREATE INDEX idx_site_directories_users_group_id ON site_directories (user_group_id);

ALTER TABLE site_directory_closure
  ADD PRIMARY KEY (ancestor_id,descendant_id);

CREATE INDEX idx_site_jobs_running ON site_jobs (running);

ALTER TABLE site_jobs_timer
  ADD PRIMARY KEY (unique_row);

CREATE INDEX idx_site_log_log_user_id ON site_log (log_user_id);

CREATE INDEX idx_site_log_users_user_id ON site_log_users (user_id,user_class);

CREATE INDEX idx_site_pages_directory_id ON site_pages (directory_id);

ALTER TABLE site_page_internal_tags
  ADD PRIMARY KEY (page_id,tag_id);

CREATE UNIQUE INDEX idx_site_page_modules_page_id ON site_page_modules (page_id,x,y);

ALTER TABLE site_page_templates
  ADD PRIMARY KEY (id);

CREATE UNIQUE INDEX idx_site_tags_name ON site_tags (name);

CREATE INDEX idx_site_uris_service ON site_uris (service);

ALTER TABLE site_uri_translators
  ADD PRIMARY KEY (id);

ALTER TABLE site_uri_translator_hosts
  ADD PRIMARY KEY (host_name,uri_translator_id);

CREATE INDEX idx_site_user_groups_parent_id ON site_user_groups (parent_id);

ALTER TABLE site_user_group_link
  ADD PRIMARY KEY (group_id,from_table,from_column,to_table,to_column);

CREATE INDEX idx_users_parent_id ON users (parent_id);

ALTER TABLE user_account_key
  ADD PRIMARY KEY (user_id);

ALTER TABLE user_page_clearance
  ADD PRIMARY KEY (user_id,page_id);

CREATE INDEX idx_user_webservice_key_passkey ON user_webservice_key (passkey);

