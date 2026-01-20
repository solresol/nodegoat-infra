CREATE TABLE data_blog_post_comments (
  id INTEGER NOT NULL,
  blog_post_id INTEGER NOT NULL,
  body TEXT  NOT NULL,
  added TIMESTAMP NOT NULL,
  name varchar(50)  NOT NULL,
  log_user_id INTEGER NOT NULL
) ;

CREATE TABLE data_blog_post_xrefs (
  id INTEGER NOT NULL,
  direction varchar(3)  NOT NULL,
  added TIMESTAMP NOT NULL,
  source varchar(255)  NOT NULL,
  blog_post_id INTEGER NOT NULL,
  title varchar(255)  DEFAULT NULL,
  excerpt TEXT 
) ;

CREATE TABLE data_dashboard_widgets (
  dashboard_id INTEGER NOT NULL,
  module_id INTEGER NOT NULL,
  method varchar(50)  NOT NULL,
  user_id INTEGER NOT NULL,
  x SMALLINT DEFAULT NULL,
  y SMALLINT DEFAULT NULL,
  min SMALLINT DEFAULT NULL
) ;

CREATE TABLE data_email_addresses (
  email varchar(100)  NOT NULL,
  name varchar(50)  NOT NULL
) ;

CREATE TABLE data_email_addresses_bounces (
  email varchar(100)  NOT NULL,
  failed SMALLINT NOT NULL,
  count SMALLINT NOT NULL,
  date_postponed TIMESTAMP NOT NULL
) ;

CREATE TABLE data_email_addresses_opt_out (
  email varchar(100)  NOT NULL
) ;

CREATE TABLE data_form_submissions (
  id INTEGER NOT NULL,
  form_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  log_user_id INTEGER NOT NULL,
  remark TEXT 
) ;

CREATE TABLE data_form_submission_field_input (
  form_submission_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  value varchar(5000)  NOT NULL
) ;

CREATE TABLE data_form_submission_field_sub_input (
  form_submission_id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  field_sub_id INTEGER NOT NULL,
  value INTEGER NOT NULL
) ;

CREATE TABLE data_form_submission_internal_tags (
  form_submission_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE TABLE data_messaging_conversations (
  id INTEGER NOT NULL,
  name varchar(30)  NOT NULL,
  subject varchar(255)  NOT NULL
) ;

CREATE TABLE data_messaging_conversation_last_seen (
  conversation_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL
) ;

CREATE TABLE data_messaging_conversation_messages (
  id INTEGER NOT NULL,
  conversation_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT  NOT NULL,
  date TIMESTAMP NOT NULL
) ;

CREATE TABLE data_messaging_conversation_participants (
  conversation_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL DEFAULT '0',
  user_group_id INTEGER NOT NULL DEFAULT '0',
  is_owner SMALLINT NOT NULL
) ;

CREATE TABLE data_poll_set_option_votes (
  poll_set_option_id INTEGER NOT NULL,
  log_user_id INTEGER NOT NULL
) ;

CREATE TABLE def_blogs (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL
) ;

CREATE TABLE def_blog_posts (
  id INTEGER NOT NULL,
  title varchar(100)  NOT NULL,
  body TEXT  NOT NULL,
  cms_user_id INTEGER NOT NULL,
  abstract TEXT  NOT NULL,
  date TIMESTAMP NOT NULL,
  para_preview SMALLINT NOT NULL,
  draft SMALLINT NOT NULL
) ;

CREATE TABLE def_blog_post_link (
  blog_id INTEGER NOT NULL,
  blog_post_id INTEGER NOT NULL
) ;

CREATE TABLE def_blog_post_tags (
  blog_post_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE TABLE def_calendar_events (
  id INTEGER NOT NULL,
  date TIMESTAMP NOT NULL,
  date_end TIMESTAMP NOT NULL,
  name varchar(100)  NOT NULL,
  description TEXT  NOT NULL,
  color varchar(6)  NOT NULL
) ;

CREATE TABLE def_calendar_event_relations (
  calendar_event_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  user_children SMALLINT NOT NULL,
  user_group_id INTEGER NOT NULL,
  cms_group SMALLINT NOT NULL
) ;

CREATE TABLE def_calendar_event_reminders (
  calendar_event_id INTEGER NOT NULL,
  amount INTEGER NOT NULL,
  unit INTEGER NOT NULL,
  executed timestamp NULL DEFAULT NULL
) ;

CREATE TABLE def_custom_content (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  body TEXT  NOT NULL,
  style varchar(30)  NOT NULL,
  script TEXT  NOT NULL,
  description TEXT  NOT NULL
) ;

CREATE TABLE def_custom_content_tags (
  custom_content_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE TABLE def_dashboards (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  directory_id INTEGER NOT NULL,
  columns SMALLINT NOT NULL
) ;

CREATE TABLE def_dashboard_widgets (
  dashboard_id INTEGER NOT NULL,
  module_id INTEGER NOT NULL,
  method varchar(50)  NOT NULL,
  x SMALLINT NOT NULL,
  y SMALLINT NOT NULL,
  min SMALLINT NOT NULL,
  locked SMALLINT NOT NULL,
  linked SMALLINT NOT NULL
) ;

CREATE TABLE def_documentations (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  description TEXT  NOT NULL
) ;

CREATE TABLE def_documentation_sections (
  id INTEGER NOT NULL,
  name varchar(150)  NOT NULL,
  documentation_id INTEGER NOT NULL,
  parent_section_id INTEGER NOT NULL,
  title varchar(100)  NOT NULL,
  body TEXT  NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL,
  publish SMALLINT NOT NULL,
  sort SMALLINT DEFAULT NULL
) ;

CREATE TABLE def_forms (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  text TEXT  NOT NULL,
  script TEXT  NOT NULL,
  label_button varchar(30)  NOT NULL,
  send_email SMALLINT NOT NULL,
  response varchar(255)  NOT NULL,
  email varchar(100)  NOT NULL,
  redirect_page_id INTEGER NOT NULL
) ;

CREATE TABLE def_form_fields (
  id INTEGER NOT NULL,
  form_id INTEGER NOT NULL,
  label varchar(255)  NOT NULL,
  type varchar(20)  NOT NULL,
  field_sub_table varchar(50)  NOT NULL,
  required SMALLINT NOT NULL,
  sort SMALLINT NOT NULL
) ;

CREATE TABLE def_form_field_sub (
  id INTEGER NOT NULL,
  field_id INTEGER NOT NULL,
  label varchar(255)  NOT NULL,
  sort SMALLINT NOT NULL
) ;

CREATE TABLE def_media (
  id INTEGER NOT NULL,
  label varchar(100)  NOT NULL,
  description TEXT  NOT NULL,
  directory varchar(250)  NOT NULL,
  filename varchar(150)  NOT NULL,
  type varchar(150)  NOT NULL,
  size INTEGER NOT NULL
) ;

CREATE TABLE def_media_internal_tags (
  media_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE TABLE def_newsletters (
  id INTEGER NOT NULL,
  title varchar(100)  NOT NULL,
  body TEXT  NOT NULL,
  date TIMESTAMP NOT NULL,
  draft SMALLINT NOT NULL,
  recipients INTEGER NOT NULL,
  bounces INTEGER NOT NULL DEFAULT '0',
  opt_out INTEGER NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_newsletters_templates (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  body TEXT  NOT NULL
) ;

CREATE TABLE def_object_interaction_objects (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  img varchar(255)  NOT NULL,
  shape varchar(30)  NOT NULL,
  class varchar(30)  NOT NULL,
  redirect_page_id INTEGER NOT NULL,
  body TEXT  NOT NULL
) ;

CREATE TABLE def_object_interaction_object_link (
  object_interaction_object_id INTEGER NOT NULL,
  object_interaction_stage_id INTEGER NOT NULL,
  pos_y decimal(7,4) NOT NULL,
  pos_x decimal(7,4) NOT NULL,
  sort SMALLINT NOT NULL,
  width decimal(7,4) NOT NULL,
  effect varchar(255)  NOT NULL,
  effect_hover varchar(255)  NOT NULL,
  script TEXT  NOT NULL,
  script_hover TEXT  NOT NULL,
  style TEXT  NOT NULL,
  style_hover TEXT  NOT NULL
) ;

CREATE TABLE def_object_interaction_stages (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  description varchar(255)  NOT NULL,
  img varchar(255)  NOT NULL,
  view_x decimal(4,2) NOT NULL,
  view_y decimal(4,2) NOT NULL,
  height_full SMALLINT NOT NULL,
  zoom_auto SMALLINT NOT NULL,
  zoom_min SMALLINT NOT NULL,
  zoom_max SMALLINT NOT NULL,
  zoom_levels SMALLINT NOT NULL,
  zoom_level_default SMALLINT NOT NULL,
  script TEXT  NOT NULL
) ;

CREATE TABLE def_polls (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL
) ;

CREATE TABLE def_poll_sets (
  id INTEGER NOT NULL,
  label varchar(255)  NOT NULL,
  enabled SMALLINT NOT NULL,
  date TIMESTAMP NOT NULL
) ;

CREATE TABLE def_poll_set_link (
  poll_id INTEGER NOT NULL,
  poll_set_id INTEGER NOT NULL
) ;

CREATE TABLE def_poll_set_options (
  id INTEGER NOT NULL,
  poll_set_id INTEGER NOT NULL,
  label varchar(255)  NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_sliders (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  timeout INTEGER NOT NULL,
  speed INTEGER NOT NULL,
  effect varchar(30)  NOT NULL
) ;

CREATE TABLE def_slider_slides (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  body TEXT  NOT NULL
) ;

CREATE TABLE def_slider_slide_link (
  slider_id INTEGER NOT NULL,
  slider_slide_id INTEGER NOT NULL,
  media_internal_tag_id INTEGER NOT NULL,
  sort INTEGER NOT NULL
) ;

CREATE TABLE def_tags (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL
) ;

CREATE TABLE site_cache_files (
  filename varchar(255)  NOT NULL
) ;

CREATE TABLE site_log_requests_access (
  id INTEGER NOT NULL,
  type varchar(25)  NOT NULL,
  ip BYTEA NOT NULL,
  ip_block BYTEA NOT NULL,
  date TIMESTAMP NOT NULL,
  identifier varchar(100)  DEFAULT NULL
) ;

CREATE TABLE site_log_requests_throttle (
  ip BYTEA NOT NULL,
  date TIMESTAMP(3) NOT NULL,
  heat REAL NOT NULL,
  state SMALLINT NOT NULL
) ;

CREATE TABLE site_user_labels (
  identifier varchar(150)  NOT NULL,
  lang_code varchar(10)  NOT NULL,
  user_id INTEGER NOT NULL,
  label TEXT  NOT NULL
) ;

CREATE TABLE user_details (
  user_id INTEGER NOT NULL,
  parent_id INTEGER NOT NULL,
  name varchar(100)  NOT NULL,
  surname varchar(100)  NOT NULL,
  street varchar(100)  NOT NULL,
  streetnr varchar(5)  NOT NULL,
  photo varchar(150)  NOT NULL
) ;

CREATE TABLE user_preferences_messaging (
  user_id INTEGER NOT NULL,
  notify_email SMALLINT NOT NULL
) ;

CREATE TABLE def_feeds (
  id INTEGER NOT NULL,
  name varchar(100)  NOT NULL
) ;

CREATE TABLE def_feed_entries (
  id INTEGER NOT NULL,
  title varchar(100)  NOT NULL,
  url varchar(255)  NOT NULL,
  media varchar(255)  NOT NULL,
  body varchar(1000)  NOT NULL,
  date TIMESTAMP NOT NULL,
  sort INTEGER NOT NULL DEFAULT '0'
) ;

CREATE TABLE def_feed_entry_link (
  feed_id INTEGER NOT NULL,
  feed_entry_id INTEGER NOT NULL
) ;

CREATE TABLE def_feed_entry_tags (
  feed_entry_id INTEGER NOT NULL,
  tag_id INTEGER NOT NULL
) ;

CREATE INDEX idx_data_blog_post_comments_blog_post_id ON data_blog_post_comments (blog_post_id);

CREATE INDEX idx_data_blog_post_xrefs_blog_post_id ON data_blog_post_xrefs (blog_post_id);

ALTER TABLE data_dashboard_widgets
  ADD PRIMARY KEY (dashboard_id,module_id,method,user_id);

ALTER TABLE data_email_addresses
  ADD PRIMARY KEY (email);

ALTER TABLE data_email_addresses_bounces
  ADD PRIMARY KEY (email);

ALTER TABLE data_email_addresses_opt_out
  ADD PRIMARY KEY (email);

CREATE INDEX idx_data_form_submissions_form_id ON data_form_submissions (form_id);

ALTER TABLE data_form_submission_field_input
  ADD PRIMARY KEY (form_submission_id,field_id);

ALTER TABLE data_form_submission_field_sub_input
  ADD PRIMARY KEY (form_submission_id,field_id,field_sub_id);

ALTER TABLE data_form_submission_internal_tags
  ADD PRIMARY KEY (form_submission_id,tag_id);

CREATE INDEX idx_data_messaging_conversations_name ON data_messaging_conversations (name);

ALTER TABLE data_messaging_conversation_last_seen
  ADD PRIMARY KEY (conversation_id,user_id);

CREATE INDEX idx_data_messaging_conversation_messages_conversation_id ON data_messaging_conversation_messages (conversation_id,user_id);

ALTER TABLE data_messaging_conversation_participants
  ADD PRIMARY KEY (conversation_id,user_id,user_group_id);

ALTER TABLE data_poll_set_option_votes
  ADD PRIMARY KEY (poll_set_option_id,log_user_id);

ALTER TABLE def_blogs
  ADD PRIMARY KEY (id);

CREATE INDEX idx_def_blog_posts_cms_user_id ON def_blog_posts (cms_user_id);

ALTER TABLE def_blog_post_link
  ADD PRIMARY KEY (blog_id,blog_post_id);

ALTER TABLE def_blog_post_tags
  ADD PRIMARY KEY (blog_post_id,tag_id);

CREATE INDEX idx_def_calendar_events_date ON def_calendar_events (date);

ALTER TABLE def_calendar_event_relations
  ADD PRIMARY KEY (calendar_event_id,user_id,user_group_id,cms_group);

ALTER TABLE def_calendar_event_reminders
  ADD PRIMARY KEY (calendar_event_id,amount,unit);

ALTER TABLE def_custom_content
  ADD PRIMARY KEY (id);

ALTER TABLE def_custom_content_tags
  ADD PRIMARY KEY (custom_content_id,tag_id);

CREATE INDEX idx_def_dashboards_directory_id ON def_dashboards (directory_id);

ALTER TABLE def_dashboard_widgets
  ADD PRIMARY KEY (dashboard_id,module_id,method);

ALTER TABLE def_documentations
  ADD PRIMARY KEY (id);

CREATE INDEX idx_def_documentation_sections_documentation_id ON def_documentation_sections (documentation_id);

ALTER TABLE def_forms
  ADD PRIMARY KEY (id);

CREATE INDEX idx_def_form_fields_form_id ON def_form_fields (form_id);

CREATE INDEX idx_def_form_field_sub_field_id ON def_form_field_sub (field_id);

CREATE INDEX idx_def_media_type ON def_media (type);

ALTER TABLE def_media_internal_tags
  ADD PRIMARY KEY (media_id,tag_id);

ALTER TABLE def_newsletters
  ADD PRIMARY KEY (id);

ALTER TABLE def_newsletters_templates
  ADD PRIMARY KEY (id);

CREATE INDEX idx_def_object_interaction_objects_redirect_page_id ON def_object_interaction_objects (redirect_page_id);

ALTER TABLE def_object_interaction_object_link
  ADD PRIMARY KEY (object_interaction_object_id,object_interaction_stage_id,pos_y,pos_x);

ALTER TABLE def_object_interaction_stages
  ADD PRIMARY KEY (id);

ALTER TABLE def_polls
  ADD PRIMARY KEY (id);

ALTER TABLE def_poll_sets
  ADD PRIMARY KEY (id);

ALTER TABLE def_poll_set_link
  ADD PRIMARY KEY (poll_id,poll_set_id);

CREATE INDEX idx_def_poll_set_options_poll_set_id ON def_poll_set_options (poll_set_id);

ALTER TABLE def_sliders
  ADD PRIMARY KEY (id);

ALTER TABLE def_slider_slides
  ADD PRIMARY KEY (id);

ALTER TABLE def_slider_slide_link
  ADD PRIMARY KEY (slider_id,slider_slide_id,media_internal_tag_id,sort);

CREATE UNIQUE INDEX idx_def_tags_name ON def_tags (name);

ALTER TABLE site_cache_files
  ADD PRIMARY KEY (filename);

CREATE INDEX idx_site_log_requests_access_identifier ON site_log_requests_access (type,date,identifier);

ALTER TABLE site_log_requests_throttle
  ADD PRIMARY KEY (ip);

ALTER TABLE site_user_labels
  ADD PRIMARY KEY (identifier,lang_code,user_id);

CREATE INDEX idx_user_details_parent_id ON user_details (parent_id);

ALTER TABLE user_preferences_messaging
  ADD PRIMARY KEY (user_id);

ALTER TABLE def_feeds
  ADD PRIMARY KEY (id);

ALTER TABLE def_feed_entries
  ADD PRIMARY KEY (id);

ALTER TABLE def_feed_entry_link
  ADD PRIMARY KEY (feed_id,feed_entry_id);

ALTER TABLE def_feed_entry_tags
  ADD PRIMARY KEY (feed_entry_id,tag_id);

