<?php
/**
 * Copyright (c) AccountProductions and Sybren Gjaltema, 2014. All rights reserved.
 */

/**
 * MySQL
 */
$mysql_host = "localhost";
$mysql_database = "minecraft";
$mysql_port = "3306";
$mysql_user = "minecraft";
$mysql_pwd = "minecraft";
$mysql_table_prefix = "Stats_";

/**
 * Minecraft Server
 */
$server_name = "semaul";
$mc_server_ip = "minec.semaul.net";
$mc_server_port = "25565";
$mc_server_disp_addr = "minec.semaul.net";

/**
 * Fluid MC Stats Interface Config
 */
$site_name = "Semaul";
$fa_icon = "fa-plus";
$avatar_service_uri = "https://minotar.net/avatar/";
$player_top_calc_stat = "playtime";
$player_on_top = "10";
$custom_footer_text = "";
$custom_links = array( // Links displayed in navbar and sidebar. Add as many as you need (Only add up to 5 from the auto install).
);
$mc_custom_icon = "http://minec.semaul.net/server-icon.png";

/**
 * Advanced User's Options
 */

/* DO NOT EDIT BELOW THIS LINE! */

/**
 * Custom URL in case you want to use a different server for file hosting. Leave blank for using the same server.
 * To use, upload the img, font-awesome, bootstrap, css, js, and less directories to the server of your choice and put the URI to them below.
 * It is recommended not to delete these directories off of this server in-case we forget to implement this in some files.
 * These are also still required to be on the local server as the install requires them.
 * You are allowed to use our CDN, please don't use it for popular sites :)
$custom_hosted_uri = "";
 */
$custom_hosted_uri = "";

/**
 * Specify required time, in seconds, players need to be included in global stats generation.
 */
$required_global_stats_time = "3600";
