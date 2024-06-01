<?php

// Read the database connection parameters from environment variables
$db_host = getenv('db-host');
$db_name = getenv('db-name');
$db_user = getenv('db-user');
$db_pass = getenv('db-password');

$con = mysqli_init();
mysqli_ssl_set($con,NULL,NULL, "{path to CA cert}", NULL, NULL);

mysqli_real_connect($conn, "db-nh-test-01.mysql.database.azure.com", "$db_user", "{$db_pass}", "{$db_name}", 3306, MYSQLI_CLIENT_SSL);