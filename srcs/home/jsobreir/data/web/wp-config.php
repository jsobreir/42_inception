<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wpuser' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'i;~:z3=g_PdBWa{fcd3O8Y-SX{Es#uA{}CBl6UxVddfF|78pF8kaTTQl.ds|@DDI' );
define( 'SECURE_AUTH_KEY',   '!/`.4_z7$`_|cGptmt/jk?Ud(:9uSNZ{G![SswvD$FK_Q6yz@mXZq;Vt4=He@N|!' );
define( 'LOGGED_IN_KEY',     '.E73=2ux[U]!4n!ja>Q3fpCsOU)#3{JY,s-?}jYOCn6-TJ/_dTofFofnXo<~g, r' );
define( 'NONCE_KEY',         'b[Z+$X&~9~(T|kh*p?T_-Fm6)th9bu3XrB2p+<?^U-hy5iG$4d=t&>6(IT:40YFv' );
define( 'AUTH_SALT',         'mwA/`am6e5OD<PU>p9%wF/MBmIT%:0N/kHz{1sQnBX#fuu8>cl{mlddXqJ_j#s>z' );
define( 'SECURE_AUTH_SALT',  '01f@z].,nVxbj2=,Z/(|P]|6H[Z>:7P)usX=7Q(u90-D+lEAb}S+J+HYoZ>LOz.2' );
define( 'LOGGED_IN_SALT',    'n&,Zl/tnv:cZhyA&$ zDj&/h-s^+6|X;ZvUz<kc3x}GCrfzX[J1dWj#%RB:u~LX}' );
define( 'NONCE_SALT',        'Kh.&K*!Z:ycC7]y%[93Sp.+>SY*])Et57]:?l#Y(;yX?L.GW5rf70.&tTnXVgkSD' );
define( 'WP_CACHE_KEY_SALT', '0_[$}D+OSbd>D;@GXFOW!//=]2L.1_JseQwI%Z!bIB7b_jx-m^&S+w*sj^WA|{.F' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
