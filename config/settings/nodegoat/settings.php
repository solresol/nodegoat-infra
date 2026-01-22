<?php

/**
 * NodeGoat settings for Docker deployment
 */

// Database names - all in nodegoat_home database using schemas
define('DATABASE_NODEGOAT_CONTENT', 'nodegoat_content');
define('DATABASE_NODEGOAT_TEMP', 'nodegoat_temp');
DB::$database_core = 'nodegoat_cms'; // Core tables (core_labels, core_language, core_users) are in nodegoat_cms schema
DB::$database_cms = 'nodegoat_cms';
DB::$database_home = 'nodegoat_home';

// Database connection details
// Host is the Docker host IP (accessible from container via extra_hosts)
$db_host = getenv('DB_HOST') ?: '172.17.0.1';
$db_port = getenv('DB_PORT') ?: '5432';

// Connection details - using SAFE directory for password files
// Note: getSafeText() prepends DIR_SAFE_SITE, so just pass the filename
DB::setConnectionDetails($db_host.':'.$db_port, 'nodegoat_cms', 'cms', DB::CONNECT_CMS);
DB::setConnectionDetails($db_host.':'.$db_port, 'nodegoat_home', 'home', DB::CONNECT_HOME);

// Graph analysis service (optional - disabled for now)
Settings::set('graph_analysis_service', false);
