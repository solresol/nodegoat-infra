CREATE TABLE data_nodegoat_custom_project_type_scenario_cache (
  project_id INTEGER NOT NULL,
  scenario_id INTEGER NOT NULL,
  use_project_id INTEGER NOT NULL,
  hash varchar(100)  NOT NULL,
  hash_date timestamp NULL DEFAULT NULL
) ;

CREATE TABLE data_nodegoat_import_template_log (
  template_id INTEGER NOT NULL,
  row_identifier INTEGER NOT NULL,
  object_id INTEGER DEFAULT NULL,
  row_data text ,
  row_filter text ,
  row_results text 
) ;

CREATE TABLE data_nodegoat_public_interface_selections (
  id varchar(30)  NOT NULL,
  date_modified date NOT NULL,
  title varchar(255)  NOT NULL,
  notes TEXT  NOT NULL,
  editor varchar(255)  NOT NULL
) ;

CREATE TABLE data_nodegoat_public_interface_selection_elements (
  selection_id varchar(30)  NOT NULL,
  elm_id varchar(30)  NOT NULL,
  type varchar(50)  NOT NULL,
  heading varchar(255)  NOT NULL,
  notes TEXT  NOT NULL,
  sort SMALLINT NOT NULL
) ;

CREATE TABLE def_nodegoat_apis (
  api_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_api_custom_projects (
  api_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  is_default SMALLINT NOT NULL DEFAULT '0',
  require_authentication SMALLINT NOT NULL DEFAULT '1',
  identifier_url varchar(1000)  NOT NULL DEFAULT ''
) ;

CREATE TABLE def_nodegoat_custom_projects (
  id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  source_referencing_enable SMALLINT NOT NULL,
  full_scope_enable SMALLINT NOT NULL,
  discussion_enable SMALLINT NOT NULL,
  system_date_cycle_enable SMALLINT NOT NULL,
  system_ingestion_enable SMALLINT NOT NULL,
  system_reconciliation_enable SMALLINT NOT NULL,
  visual_settings_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_date_types (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_location_types (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_source_types (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_types (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  color varchar(10)  NOT NULL DEFAULT '',
  type_information text ,
  type_edit SMALLINT NOT NULL DEFAULT '2',
  type_filter_id INTEGER NOT NULL DEFAULT '0',
  type_filter_object_subs SMALLINT NOT NULL DEFAULT '0',
  type_context_id INTEGER NOT NULL DEFAULT '0',
  type_frame_id INTEGER NOT NULL DEFAULT '0',
  type_condition_id INTEGER NOT NULL DEFAULT '0',
  configuration_exclude SMALLINT NOT NULL DEFAULT '0',
  sort SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_nodegoat_custom_project_type_analyses (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description TEXT  NOT NULL,
  algorithm varchar(50)  NOT NULL,
  object TEXT  NOT NULL,
  scope_object TEXT  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_analyses_contexts (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description text  NOT NULL,
  object text  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_conditions (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  description TEXT  NOT NULL,
  object TEXT  NOT NULL,
  model_object text  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_configuration (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  object_sub_details_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  edit SMALLINT NOT NULL,
  view SMALLINT NOT NULL,
  filter_id INTEGER NOT NULL,
  information text 
) ;

CREATE TABLE def_nodegoat_custom_project_type_contexts (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description text  NOT NULL,
  object text  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_export_settings (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description TEXT  NOT NULL,
  format_type varchar(10)  NOT NULL,
  format_include_description_name SMALLINT DEFAULT NULL,
  format_object TEXT  NOT NULL,
  scope_object TEXT  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_filters (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  type_id INTEGER NOT NULL,
  description TEXT  NOT NULL,
  object TEXT  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_frames (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description TEXT  NOT NULL,
  area_geo_latitude decimal(10,8) DEFAULT NULL,
  area_geo_longitude decimal(11,8) DEFAULT NULL,
  area_geo_zoom_scale SMALLINT NOT NULL,
  area_geo_zoom_min SMALLINT NOT NULL,
  area_geo_zoom_max SMALLINT NOT NULL,
  area_social_object_id INTEGER NOT NULL,
  area_social_zoom_level SMALLINT NOT NULL,
  area_social_zoom_min SMALLINT NOT NULL,
  area_social_zoom_max SMALLINT NOT NULL,
  time_bounds_date_start BIGINT NOT NULL,
  time_bounds_date_end BIGINT NOT NULL,
  time_selection_date_start BIGINT NOT NULL,
  time_selection_date_end BIGINT NOT NULL,
  object_subs_unknown_date varchar(30)  DEFAULT NULL,
  object_subs_unknown_location varchar(30)  DEFAULT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_include_referenced_types (
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  referenced_type_id INTEGER NOT NULL,
  object_description_id INTEGER NOT NULL,
  object_sub_details_id INTEGER NOT NULL,
  object_sub_description_id INTEGER NOT NULL,
  edit SMALLINT NOT NULL,
  view SMALLINT NOT NULL,
  filter_id INTEGER NOT NULL,
  information text 
) ;

CREATE TABLE def_nodegoat_custom_project_type_scenarios (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  type_id INTEGER NOT NULL,
  description TEXT  NOT NULL,
  attribution varchar(1000)  NOT NULL,
  filter_id INTEGER NOT NULL,
  filter_use_current SMALLINT NOT NULL,
  scope_id INTEGER NOT NULL,
  scope_use_current SMALLINT NOT NULL,
  condition_id INTEGER NOT NULL,
  condition_use_current SMALLINT NOT NULL,
  context_id INTEGER NOT NULL,
  context_use_current SMALLINT NOT NULL,
  frame_id INTEGER NOT NULL,
  frame_use_current SMALLINT NOT NULL,
  visual_settings_id INTEGER NOT NULL,
  visual_settings_use_current SMALLINT NOT NULL,
  analysis_id INTEGER NOT NULL,
  analysis_use_current SMALLINT NOT NULL,
  analysis_context_id INTEGER NOT NULL,
  analysis_context_use_current SMALLINT NOT NULL,
  cache_retain SMALLINT NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_type_scopes (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description TEXT  NOT NULL,
  object TEXT  NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_use_projects (
  project_id INTEGER NOT NULL,
  use_project_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_custom_project_visual_settings (
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  description TEXT  NOT NULL,
  capture_enable SMALLINT DEFAULT NULL,
  capture_settings varchar(1000)  NOT NULL,
  dot_show SMALLINT DEFAULT NULL,
  dot_size_min REAL NOT NULL,
  dot_size_max REAL NOT NULL,
  dot_size_start INTEGER NOT NULL,
  dot_size_stop INTEGER NOT NULL,
  dot_color varchar(10)  NOT NULL,
  dot_opacity REAL DEFAULT NULL,
  dot_color_condition varchar(50)  NOT NULL,
  dot_stroke_color varchar(10)  NOT NULL,
  dot_stroke_opacity REAL NOT NULL,
  dot_stroke_width REAL DEFAULT NULL,
  location_show SMALLINT DEFAULT NULL,
  location_color varchar(10)  NOT NULL,
  location_opacity REAL NOT NULL,
  location_size REAL NOT NULL,
  location_threshold SMALLINT NOT NULL,
  location_offset SMALLINT DEFAULT NULL,
  location_position varchar(100)  NOT NULL,
  location_condition varchar(50)  NOT NULL,
  line_show SMALLINT DEFAULT NULL,
  line_color varchar(10)  NOT NULL,
  line_opacity REAL NOT NULL,
  line_width_min REAL NOT NULL,
  line_width_max REAL NOT NULL,
  line_offset SMALLINT DEFAULT NULL,
  map_show SMALLINT DEFAULT NULL,
  map_layers varchar(5000)  NOT NULL,
  visual_hints_show SMALLINT DEFAULT NULL,
  visual_hints_size REAL NOT NULL,
  visual_hints_color varchar(10)  NOT NULL,
  visual_hints_opacity REAL DEFAULT NULL,
  visual_hints_stroke_color varchar(10)  NOT NULL,
  visual_hints_stroke_opacity REAL NOT NULL,
  visual_hints_stroke_width REAL DEFAULT NULL,
  visual_hints_duration REAL NOT NULL,
  visual_hints_delay REAL NOT NULL,
  geometry_show SMALLINT DEFAULT NULL,
  geometry_color varchar(10)  NOT NULL,
  geometry_opacity REAL DEFAULT NULL,
  geometry_stroke_color varchar(10)  NOT NULL,
  geometry_stroke_opacity REAL NOT NULL,
  geometry_stroke_width REAL DEFAULT NULL,
  geo_info_show SMALLINT DEFAULT NULL,
  geo_background_color varchar(10)  NOT NULL,
  geo_mode SMALLINT DEFAULT NULL,
  geo_display SMALLINT DEFAULT NULL,
  geo_advanced varchar(2000)  NOT NULL,
  social_dot_color varchar(10)  NOT NULL,
  social_dot_size_min REAL NOT NULL,
  social_dot_size_max REAL NOT NULL,
  social_dot_size_start INTEGER NOT NULL,
  social_dot_size_stop INTEGER NOT NULL,
  social_dot_stroke_color varchar(10)  NOT NULL,
  social_dot_stroke_width REAL DEFAULT NULL,
  social_label_show SMALLINT DEFAULT NULL,
  social_label_threshold REAL DEFAULT NULL,
  social_label_condition varchar(50)  NOT NULL,
  social_line_arrowhead_show SMALLINT DEFAULT NULL,
  social_line_show SMALLINT DEFAULT NULL,
  social_line_color varchar(10)  NOT NULL,
  social_line_opacity REAL NOT NULL,
  social_line_width_min REAL NOT NULL,
  social_line_width_max REAL NOT NULL,
  social_force varchar(100)  NOT NULL,
  social_forceatlas2 varchar(250)  NOT NULL,
  social_disconnected_dot_show SMALLINT DEFAULT NULL,
  social_include_location_references SMALLINT DEFAULT NULL,
  social_background_color varchar(10)  NOT NULL,
  social_display SMALLINT DEFAULT NULL,
  social_static_layout SMALLINT DEFAULT NULL,
  social_static_layout_interval REAL DEFAULT NULL,
  social_advanced varchar(2000)  NOT NULL,
  time_bar_color varchar(10)  NOT NULL,
  time_bar_opacity REAL NOT NULL,
  time_background_color varchar(10)  NOT NULL,
  time_relative_graph SMALLINT DEFAULT NULL,
  time_cumulative_graph SMALLINT DEFAULT NULL
) ;

CREATE TABLE def_nodegoat_details (
  unique_row SMALLINT NOT NULL DEFAULT '1',
  processing_memory INTEGER NOT NULL,
  processing_time INTEGER NOT NULL,
  limit_view INTEGER NOT NULL,
  limit_import INTEGER NOT NULL,
  limit_file_size varchar(20)  NOT NULL
) ;

CREATE TABLE def_nodegoat_import_files (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  description TEXT  NOT NULL,
  filename varchar(150)  NOT NULL,
  total_objects INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_import_templates (
  id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  source_id INTEGER NOT NULL,
  mode SMALLINT NOT NULL,
  name varchar(150)  NOT NULL,
  description TEXT  NOT NULL,
  use_log SMALLINT NOT NULL,
  last_run date DEFAULT NULL
) ;

CREATE TABLE def_nodegoat_import_template_columns (
  id INTEGER NOT NULL,
  template_id INTEGER NOT NULL,
  pointer_heading varchar(200)  NOT NULL,
  pointer_class SMALLINT NOT NULL,
  value_split varchar(5)  NOT NULL,
  value_index varchar(10)  NOT NULL,
  element_id varchar(100)  NOT NULL,
  element_type_id INTEGER NOT NULL,
  element_type_object_sub_id INTEGER NOT NULL,
  element_type_element_id varchar(100)  NOT NULL,
  overwrite SMALLINT NOT NULL,
  ignore_when SMALLINT NOT NULL,
  heading_for_source_link varchar(200)  DEFAULT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_linked_data_conversions (
  id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  description TEXT  NOT NULL,
  script TEXT  NOT NULL,
  output_placeholder varchar(1000)  NOT NULL,
  input_placeholder varchar(1000)  NOT NULL
) ;

CREATE TABLE def_nodegoat_linked_data_resources (
  id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  description TEXT  NOT NULL,
  protocol varchar(50)  NOT NULL,
  url varchar(255)  NOT NULL,
  url_options varchar(255)  NOT NULL,
  url_headers varchar(5000)  NOT NULL,
  query TEXT  NOT NULL,
  response_uri_value TEXT  NOT NULL,
  response_uri_template varchar(255)  NOT NULL,
  response_uri_conversion_id INTEGER NOT NULL,
  response_uri_conversion_output_identifier varchar(100)  NOT NULL DEFAULT '',
  response_label_value TEXT  NOT NULL,
  response_label_conversion_id INTEGER NOT NULL,
  response_label_conversion_output_identifier varchar(100)  NOT NULL DEFAULT ''
) ;

CREATE TABLE def_nodegoat_linked_data_resource_values (
  resource_id INTEGER NOT NULL,
  name varchar(50)  NOT NULL,
  value TEXT  NOT NULL,
  conversion_id INTEGER NOT NULL,
  conversion_output_identifier varchar(100)  NOT NULL DEFAULT '',
  sort SMALLINT NOT NULL
) ;

CREATE TABLE def_nodegoat_pattern_type_object_pairs (
  type_id INTEGER NOT NULL,
  identifier BYTEA(16) NOT NULL,
  pattern_value TEXT  NOT NULL,
  object_id INTEGER DEFAULT NULL,
  composition SMALLINT NOT NULL,
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ;

CREATE TABLE def_nodegoat_public_interfaces (
  id INTEGER NOT NULL,
  name varchar(255)  NOT NULL,
  mode varchar(50)  NOT NULL,
  settings TEXT  NOT NULL,
  description varchar(255)  NOT NULL,
  information TEXT  NOT NULL,
  css TEXT  NOT NULL,
  script TEXT  NOT NULL,
  is_default SMALLINT NOT NULL
) ;

CREATE TABLE def_nodegoat_public_interface_projects (
  public_interface_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  sort SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_nodegoat_public_interface_project_scenarios (
  public_interface_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  scenario_id INTEGER NOT NULL,
  browse SMALLINT NOT NULL,
  list SMALLINT NOT NULL,
  geographic_visualisation SMALLINT NOT NULL,
  social_visualisation SMALLINT NOT NULL,
  time_visualisation SMALLINT NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_public_interface_project_types (
  public_interface_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  type_id INTEGER NOT NULL,
  is_filter SMALLINT NOT NULL,
  browse SMALLINT DEFAULT NULL,
  list SMALLINT DEFAULT NULL,
  geographic_visualisation SMALLINT DEFAULT NULL,
  social_visualisation SMALLINT DEFAULT NULL,
  time_visualisation SMALLINT DEFAULT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_public_interface_texts (
  id INTEGER NOT NULL,
  public_interface_id INTEGER NOT NULL,
  name varchar(255)  NOT NULL,
  text TEXT  NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE user_link_nodegoat_custom_projects (
  user_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  is_active SMALLINT NOT NULL DEFAULT '0'
) ;

CREATE TABLE user_link_nodegoat_custom_project_type_filters (
  user_id INTEGER NOT NULL,
  project_id INTEGER NOT NULL,
  filter_id INTEGER NOT NULL,
  source SMALLINT NOT NULL
) ;

CREATE TABLE user_preferences (
  user_id INTEGER NOT NULL
) ;

CREATE TABLE def_nodegoat_publish_custom_projects (
  project_id INTEGER NOT NULL,
  is_default SMALLINT NOT NULL DEFAULT '0',
  description text ,
  public_interface_id INTEGER NOT NULL DEFAULT '0',
  date TIMESTAMP DEFAULT NULL
) ;

ALTER TABLE data_nodegoat_custom_project_type_scenario_cache
  ADD PRIMARY KEY (project_id,scenario_id,use_project_id);

ALTER TABLE data_nodegoat_import_template_log
  ADD PRIMARY KEY (template_id,row_identifier);

ALTER TABLE data_nodegoat_public_interface_selections
  ADD PRIMARY KEY (id);

ALTER TABLE data_nodegoat_public_interface_selection_elements
  ADD PRIMARY KEY (selection_id,elm_id);

ALTER TABLE def_nodegoat_apis
  ADD PRIMARY KEY (api_id);

ALTER TABLE def_nodegoat_api_custom_projects
  ADD PRIMARY KEY (api_id,project_id);

CREATE INDEX idx_def_nodegoat_custom_projects_visual_settings_id ON def_nodegoat_custom_projects (visual_settings_id);

ALTER TABLE def_nodegoat_custom_project_date_types
  ADD PRIMARY KEY (project_id,type_id);

ALTER TABLE def_nodegoat_custom_project_location_types
  ADD PRIMARY KEY (project_id,type_id);

ALTER TABLE def_nodegoat_custom_project_source_types
  ADD PRIMARY KEY (project_id,type_id);

ALTER TABLE def_nodegoat_custom_project_types
  ADD PRIMARY KEY (project_id,type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_analyses_type_id ON def_nodegoat_custom_project_type_analyses (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_analyses_contexts_type_id ON def_nodegoat_custom_project_type_analyses_contexts (type_id);

ALTER TABLE def_nodegoat_custom_project_type_conditions
  ADD PRIMARY KEY (project_id,user_id,id,type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_configuration_edit ON def_nodegoat_custom_project_type_configuration (edit);

CREATE INDEX idx_def_nodegoat_custom_project_type_contexts_type_id ON def_nodegoat_custom_project_type_contexts (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_export_settings_type_id ON def_nodegoat_custom_project_type_export_settings (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_filters_type_id ON def_nodegoat_custom_project_type_filters (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_frames_type_id ON def_nodegoat_custom_project_type_frames (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_include_referenced_types_edit ON def_nodegoat_custom_project_type_include_referenced_types (edit);

CREATE INDEX idx_def_nodegoat_custom_project_type_scenarios_type_id ON def_nodegoat_custom_project_type_scenarios (type_id);

CREATE INDEX idx_def_nodegoat_custom_project_type_scopes_type_id ON def_nodegoat_custom_project_type_scopes (type_id);

ALTER TABLE def_nodegoat_custom_project_use_projects
  ADD PRIMARY KEY (project_id,use_project_id);

CREATE INDEX idx_def_nodegoat_custom_project_visual_settings_user_id ON def_nodegoat_custom_project_visual_settings (user_id);

ALTER TABLE def_nodegoat_details
  ADD PRIMARY KEY (unique_row);

ALTER TABLE def_nodegoat_import_files
  ADD PRIMARY KEY (id);

ALTER TABLE def_nodegoat_import_templates
  ADD PRIMARY KEY (id);

ALTER TABLE def_nodegoat_import_template_columns
  ADD PRIMARY KEY (id);

ALTER TABLE def_nodegoat_linked_data_conversions
  ADD PRIMARY KEY (id);

ALTER TABLE def_nodegoat_linked_data_resources
  ADD PRIMARY KEY (id);

CREATE INDEX idx_def_nodegoat_linked_data_resource_values_sort ON def_nodegoat_linked_data_resource_values (sort);

ALTER TABLE def_nodegoat_pattern_type_object_pairs
  ADD PRIMARY KEY (type_id,identifier);

ALTER TABLE def_nodegoat_public_interfaces
  ADD PRIMARY KEY (id);

ALTER TABLE def_nodegoat_public_interface_projects
  ADD PRIMARY KEY (public_interface_id,project_id);

ALTER TABLE def_nodegoat_public_interface_project_scenarios
  ADD PRIMARY KEY (public_interface_id,project_id,scenario_id);

ALTER TABLE def_nodegoat_public_interface_project_types
  ADD PRIMARY KEY (public_interface_id,project_id,type_id);

ALTER TABLE def_nodegoat_public_interface_texts
  ADD PRIMARY KEY (id);

ALTER TABLE user_link_nodegoat_custom_projects
  ADD PRIMARY KEY (user_id,project_id);

CREATE INDEX idx_user_link_nodegoat_custom_project_type_filters_type ON user_link_nodegoat_custom_project_type_filters (source);

ALTER TABLE user_preferences
  ADD PRIMARY KEY (user_id);

ALTER TABLE def_nodegoat_publish_custom_projects
  ADD PRIMARY KEY (project_id);

