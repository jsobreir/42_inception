<?php
/**
 * The base configuration for WordPress
 */

// ** MySQL settings ** //

// define( 'DB_NAME','wordpress');
// define( 'DB_USER', 'jsobreir' );
// define( 'DB_PASSWORD', 'wordpress' );
// define( 'DB_HOST', 'mariadb:3306' );
// define( 'DB_CHARSET', 'utf8mb4' );
// define( 'DB_COLLATE', '' );

define( 'DB_NAME', getenv('WORDPRESS_DB_NAME'));
define( 'DB_USER', getenv('WORDPRESS_DB_USER'));
define( 'DB_PASSWORD', getenv('WORDPRESS_DB_PASSWORD'));
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST'));
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

// ** Authentication Unique Keys and Salts ** //
define( 'AUTH_KEY',         '' );
define( 'SECURE_AUTH_KEY',  '' );
define( 'LOGGED_IN_KEY',    '' );
define( 'NONCE_KEY',        '' );
define( 'AUTH_SALT',        '' );
define( 'SECURE_AUTH_SALT', '' );
define( 'LOGGED_IN_SALT',   '' );
define( 'NONCE_SALT',       '' );

// ** WordPress Database Table prefix ** //
$table_prefix = 'wp_';

// ** WordPress debugging mode ** //
define( 'WP_DEBUG', false );

// ** Absolute path to the WordPress directory ** //
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

// ** Sets up WordPress vars and included files ** //
require_once ABSPATH . 'wp-settings.php';