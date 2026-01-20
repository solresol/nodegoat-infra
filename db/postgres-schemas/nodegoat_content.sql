CREATE TABLE cache_type_object_sub_date (
  object_sub_id INTEGER NOT NULL,
  date_start_start BIGINT NOT NULL DEFAULT '0',
  date_start_end BIGINT DEFAULT NULL,
  date_end_start BIGINT DEFAULT NULL,
  date_end_end BIGINT NOT NULL DEFAULT '0',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0',
  state SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE cache_type_object_sub_date_path (
  object_sub_id INTEGER NOT NULL,
  path_object_sub_id INTEGER NOT NULL,
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0',
  state SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE cache_type_object_sub_location (
  object_sub_id INTEGER NOT NULL,
  object_sub_details_id INTEGER NOT NULL,
  geometry_object_sub_id INTEGER NOT NULL,
  geometry_object_id INTEGER NOT NULL,
  geometry_type_id INTEGER NOT NULL,
  ref_object_id INTEGER DEFAULT NULL,
  ref_type_id INTEGER DEFAULT NULL,
  ref_object_sub_details_id INTEGER DEFAULT NULL,
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0',
  state SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE cache_type_object_sub_location_path (
  object_sub_id INTEGER NOT NULL,
  path_object_sub_id INTEGER NOT NULL,
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0',
  state SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_objects (
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(255)  DEFAULT NULL,
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_analyses (
  user_id INTEGER NOT NULL,
  analysis_id INTEGER NOT NULL,
  object_id INTEGER NOT NULL,
  number DOUBLE PRECISION NOT NULL,
  number_secondary DOUBLE PRECISION DEFAULT NULL,
  state SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_analysis_status (
  user_id INTEGER NOT NULL,
  analysis_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL
) ;

CREATE TABLE data_type_object_definitions (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  value varchar(5000)  NOT NULL DEFAULT '',
  value_int BIGINT NOT NULL DEFAULT '0',
  value_text TEXT ,
  identifier INTEGER NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_definitions_modules (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  object json DEFAULT NULL,
  identifier SMALLINT NOT NULL DEFAULT '0',
  state SMALLINT NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_definitions_module_status (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_definitions_references (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL DEFAULT '0',
  identifier INTEGER NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_definition_objects (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(5000)  DEFAULT NULL,
  identifier INTEGER NOT NULL,
  state SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_definition_sources (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(1000)  NOT NULL,
  hash BYTEA(16) NOT NULL
) ;

CREATE TABLE data_type_object_definition_version (
  object_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  version SMALLINT NOT NULL,
  user_id INTEGER NOT NULL,
  system_object_id INTEGER DEFAULT NULL,
  date TIMESTAMP NOT NULL,
  user_id_audited INTEGER NOT NULL DEFAULT '0',
  date_audited TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE data_type_object_discussion (
  object_id INTEGER NOT NULL,
  body TEXT  NOT NULL,
  date_edited TIMESTAMP NOT NULL,
  user_id_edited INTEGER NOT NULL
) ;

CREATE TABLE data_type_object_lock (
  object_id INTEGER NOT NULL,
  type SMALLINT NOT NULL DEFAULT '1',
  user_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  identifier varchar(32)  NOT NULL
) ;

CREATE TABLE data_type_object_sources (
  object_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(1000)  NOT NULL,
  hash BYTEA(16) NOT NULL
) ;

CREATE TABLE data_type_object_status (
  object_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  date_object TIMESTAMP NOT NULL,
  date_discussion TIMESTAMP DEFAULT NULL,
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_subs (
  id INTEGER NOT NULL,
  object_id INTEGER NOT NULL,
  object_sub_details_id INTEGER NOT NULL,
  date_version SMALLINT DEFAULT NULL,
  location_geometry_version SMALLINT DEFAULT NULL,
  location_ref_object_id INTEGER NOT NULL,
  location_ref_type_id INTEGER NOT NULL,
  location_ref_object_sub_details_id INTEGER NOT NULL,
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_sub_date (
  object_sub_id INTEGER NOT NULL,
  span_period_amount SMALLINT NOT NULL DEFAULT '0',
  span_period_unit SMALLINT NOT NULL DEFAULT '0',
  span_cycle_object_id INTEGER NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_sub_date_chronology (
  object_sub_id INTEGER NOT NULL,
  offset_amount SMALLINT NOT NULL DEFAULT '0',
  offset_unit SMALLINT NOT NULL DEFAULT '0',
  cycle_object_id INTEGER NOT NULL DEFAULT '0',
  cycle_direction SMALLINT NOT NULL DEFAULT '0',
  date_value BIGINT DEFAULT NULL,
  date_object_sub_id INTEGER DEFAULT NULL,
  date_direction SMALLINT NOT NULL DEFAULT '0',
  identifier SMALLINT NOT NULL,
  active SMALLINT NOT NULL,
  version SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_sub_definitions (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  value varchar(5000)  NOT NULL DEFAULT '',
  value_int BIGINT NOT NULL DEFAULT '0',
  value_text TEXT ,
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_sub_definitions_modules (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  object json DEFAULT NULL,
  state SMALLINT NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_sub_definitions_references (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL DEFAULT '0',
  version SMALLINT NOT NULL DEFAULT '1',
  active SMALLINT NOT NULL DEFAULT '0',
  status SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE data_type_object_sub_definition_objects (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(5000)  DEFAULT NULL,
  identifier INTEGER NOT NULL,
  state SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_sub_definition_sources (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(1000)  NOT NULL,
  hash BYTEA(16) NOT NULL
) ;

CREATE TABLE data_type_object_sub_definition_version (
  object_sub_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  version SMALLINT NOT NULL,
  user_id INTEGER NOT NULL,
  system_object_id INTEGER DEFAULT NULL,
  date TIMESTAMP NOT NULL,
  user_id_audited INTEGER NOT NULL DEFAULT '0',
  date_audited TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE data_type_object_sub_location_geometry (
  object_sub_id INTEGER NOT NULL,
  geometry geometry NOT NULL,
  version SMALLINT NOT NULL
) ;

CREATE TABLE data_type_object_sub_sources (
  object_sub_id INTEGER NOT NULL,
  ref_object_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  value varchar(1000)  NOT NULL,
  hash BYTEA(16) NOT NULL
) ;

CREATE TABLE data_type_object_sub_version (
  object_sub_id INTEGER NOT NULL,
  version SMALLINT NOT NULL,
  user_id INTEGER NOT NULL,
  system_object_id INTEGER DEFAULT NULL,
  date TIMESTAMP NOT NULL,
  user_id_audited INTEGER NOT NULL DEFAULT '0',
  date_audited TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE data_type_object_version (
  object_id INTEGER NOT NULL,
  version SMALLINT NOT NULL,
  user_id INTEGER NOT NULL,
  system_object_id INTEGER DEFAULT NULL,
  date TIMESTAMP NOT NULL,
  user_id_audited INTEGER NOT NULL DEFAULT '0',
  date_audited TIMESTAMP DEFAULT NULL
) ;

CREATE TABLE def_types (
  id INTEGER NOT NULL,
  class SMALLINT NOT NULL,
  mode SMALLINT NOT NULL,
  name varchar(150)  NOT NULL,
  label varchar(50)  NOT NULL,
  color varchar(10)  NOT NULL,
  condition_id INTEGER NOT NULL,
  clearance_edit SMALLINT NOT NULL,
  date TIMESTAMP NOT NULL,
  use_object_name SMALLINT NOT NULL,
  object_name_in_overview SMALLINT NOT NULL
) ;

CREATE TABLE def_type_definitions (
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  text TEXT  NOT NULL,
  sort SMALLINT NOT NULL
) ;

CREATE TABLE def_type_object_descriptions (
  id INTEGER NOT NULL,
  id_id INTEGER DEFAULT NULL,
  type_id INTEGER NOT NULL,
  name varchar(150)  DEFAULT NULL,
  value_type_base varchar(30)  NOT NULL DEFAULT '',
  value_type_settings varchar(1000)  NOT NULL DEFAULT '',
  value_type_serial INTEGER DEFAULT NULL,
  is_required SMALLINT NOT NULL DEFAULT '0',
  is_unique SMALLINT NOT NULL DEFAULT '0',
  has_multi SMALLINT NOT NULL DEFAULT '0',
  ref_type_id INTEGER NOT NULL,
  in_name SMALLINT NOT NULL DEFAULT '0',
  in_search SMALLINT NOT NULL DEFAULT '0',
  in_overview SMALLINT NOT NULL DEFAULT '0',
  is_identifier SMALLINT NOT NULL DEFAULT '0',
  clearance_edit SMALLINT NOT NULL DEFAULT '0',
  clearance_view SMALLINT NOT NULL DEFAULT '0',
  sort SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_type_object_name_path (
  type_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  ref_object_description_id INTEGER NOT NULL,
  ref_object_sub_details_id INTEGER NOT NULL,
  org_object_description_id INTEGER NOT NULL,
  org_object_sub_details_id INTEGER NOT NULL,
  is_reference SMALLINT NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_type_object_search_path (
  type_id INTEGER NOT NULL,
  ref_type_id INTEGER NOT NULL,
  ref_object_description_id INTEGER NOT NULL,
  ref_object_sub_details_id INTEGER NOT NULL,
  org_object_description_id INTEGER NOT NULL,
  org_object_sub_details_id INTEGER NOT NULL,
  is_reference SMALLINT NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_type_object_sub_descriptions (
  id INTEGER NOT NULL,
  id_id INTEGER DEFAULT NULL,
  object_sub_details_id INTEGER NOT NULL,
  name varchar(150)  DEFAULT NULL,
  value_type_base varchar(30)  NOT NULL DEFAULT '',
  value_type_settings varchar(1000)  NOT NULL DEFAULT '',
  value_type_serial INTEGER DEFAULT NULL,
  is_required SMALLINT NOT NULL DEFAULT '0',
  use_object_description_id INTEGER NOT NULL DEFAULT '0',
  ref_type_id INTEGER NOT NULL,
  in_name SMALLINT NOT NULL DEFAULT '0',
  in_search SMALLINT NOT NULL DEFAULT '0',
  in_overview SMALLINT NOT NULL DEFAULT '0',
  clearance_edit SMALLINT NOT NULL DEFAULT '0',
  clearance_view SMALLINT NOT NULL DEFAULT '0',
  sort SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_type_object_sub_details (
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  is_required SMALLINT NOT NULL,
  is_single SMALLINT NOT NULL,
  clearance_edit SMALLINT NOT NULL,
  clearance_view SMALLINT NOT NULL,
  has_date SMALLINT NOT NULL,
  is_date_period SMALLINT NOT NULL,
  date_setting SMALLINT NOT NULL,
  date_setting_type_id INTEGER NOT NULL,
  date_setting_object_sub_details_id INTEGER NOT NULL,
  date_use_object_sub_details_id INTEGER NOT NULL,
  date_start_use_object_sub_description_id INTEGER NOT NULL,
  date_start_use_object_description_id INTEGER NOT NULL,
  date_end_use_object_sub_description_id INTEGER NOT NULL,
  date_end_use_object_description_id INTEGER NOT NULL,
  has_location SMALLINT NOT NULL,
  location_setting SMALLINT NOT NULL,
  location_ref_type_id INTEGER NOT NULL,
  location_ref_type_id_locked SMALLINT NOT NULL,
  location_ref_object_sub_details_id INTEGER NOT NULL,
  location_ref_object_sub_details_id_locked SMALLINT NOT NULL,
  location_use_object_sub_details_id INTEGER NOT NULL,
  location_use_object_sub_description_id INTEGER NOT NULL,
  location_use_object_description_id INTEGER NOT NULL,
  location_use_object_id SMALLINT NOT NULL,
  sort SMALLINT NOT NULL
) ;

CREATE INDEX idx_cache_type_object_sub_date_state ON cache_type_object_sub_date (state);

CREATE INDEX idx_cache_type_object_sub_date_path_state ON cache_type_object_sub_date_path (state);

CREATE INDEX idx_cache_type_object_sub_location_ref_type_id ON cache_type_object_sub_location (ref_type_id,object_sub_details_id,ref_object_id);

CREATE INDEX idx_cache_type_object_sub_location_path_state ON cache_type_object_sub_location_path (state);

CREATE INDEX idx_data_type_objects_active ON data_type_objects (active,status);

CREATE INDEX idx_data_type_object_analyses_state ON data_type_object_analyses (state);

CREATE INDEX idx_data_type_object_analysis_status_date ON data_type_object_analysis_status (date);

CREATE INDEX idx_data_type_object_definitions_object_description_id ON data_type_object_definitions (object_description_id);

CREATE INDEX idx_data_type_object_definitions_modules_object_description_id ON data_type_object_definitions_modules (object_description_id);

ALTER TABLE data_type_object_definitions_module_status
  ADD PRIMARY KEY (object_id,object_description_id,ref_object_id);

CREATE INDEX idx_data_type_object_definitions_references_ref_object_id ON data_type_object_definitions_references (ref_object_id);

CREATE INDEX idx_data_type_object_definition_objects_object_description_id ON data_type_object_definition_objects (object_description_id,state,ref_type_id);

CREATE INDEX idx_data_type_object_definition_sources_ref_type_id ON data_type_object_definition_sources (ref_type_id);

CREATE INDEX idx_data_type_object_definition_version_user_id ON data_type_object_definition_version (user_id);

CREATE INDEX idx_data_type_object_discussion_date_edited ON data_type_object_discussion (date_edited);

CREATE INDEX idx_data_type_object_lock_user_id ON data_type_object_lock (user_id);

CREATE INDEX idx_data_type_object_sources_ref_type_id ON data_type_object_sources (ref_type_id);

CREATE INDEX idx_data_type_object_status_date ON data_type_object_status (date);

CREATE INDEX idx_data_type_object_subs_object_id ON data_type_object_subs (object_id,object_sub_details_id);

CREATE INDEX idx_data_type_object_sub_date_span_cycle_object_id ON data_type_object_sub_date (span_cycle_object_id);

CREATE INDEX idx_data_type_object_sub_date_chronology_cycle_object_id ON data_type_object_sub_date_chronology (cycle_object_id);

CREATE INDEX idx_data_type_object_sub_definitions_active ON data_type_object_sub_definitions (active,status);

CREATE INDEX idx_data_type_object_sub_definitions_modules_object_sub_description_id ON data_type_object_sub_definitions_modules (object_sub_description_id);

CREATE INDEX idx_data_type_object_sub_definitions_references_ref_object_id ON data_type_object_sub_definitions_references (ref_object_id);

CREATE INDEX idx_data_type_object_sub_definition_objects_object_sub_description_id ON data_type_object_sub_definition_objects (object_sub_description_id,state,ref_type_id);

CREATE INDEX idx_data_type_object_sub_definition_sources_ref_type_id ON data_type_object_sub_definition_sources (ref_type_id);

CREATE INDEX idx_data_type_object_sub_definition_version_user_id ON data_type_object_sub_definition_version (user_id);

ALTER TABLE data_type_object_sub_location_geometry
  ADD PRIMARY KEY (object_sub_id,version),
  ADD SPATIAL KEY geometry (geometry);

CREATE INDEX idx_data_type_object_sub_sources_ref_type_id ON data_type_object_sub_sources (ref_type_id);

CREATE INDEX idx_data_type_object_sub_version_user_id ON data_type_object_sub_version (user_id);

CREATE INDEX idx_data_type_object_version_user_id ON data_type_object_version (user_id);

CREATE INDEX idx_def_types_condition_id ON def_types (condition_id);

CREATE INDEX idx_def_type_definitions_type_id ON def_type_definitions (type_id);

CREATE INDEX idx_def_type_object_descriptions_ref_type_id ON def_type_object_descriptions (ref_type_id);

ALTER TABLE def_type_object_name_path
  ADD PRIMARY KEY (type_id,ref_type_id,ref_object_description_id,ref_object_sub_details_id,org_object_description_id,org_object_sub_details_id,sort);

ALTER TABLE def_type_object_search_path
  ADD PRIMARY KEY (type_id,ref_type_id,ref_object_description_id,ref_object_sub_details_id,org_object_description_id,org_object_sub_details_id,sort);

CREATE INDEX idx_def_type_object_sub_descriptions_ref_type_id ON def_type_object_sub_descriptions (ref_type_id);

CREATE INDEX idx_def_type_object_sub_details_location_ref_object_sub_details_id ON def_type_object_sub_details (location_ref_object_sub_details_id);

