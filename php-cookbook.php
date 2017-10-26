<?php

// enable error reporting for a single page (E_ALL)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// enable session storage
session_name("session_name");
session_start();

// Access session variables
if(isset($_SESSION['session_variable'])) {
	blabla();
}

/* Export SQL Query to csv */
// --------------------
// Establish MySQL Connection
$con = new mysqli('localhost','username','password','dbname');
// Set query
$query = 'SELECT * FROM `table`';

// Execute and collect in $rows, then export to csv
$result = mysqli_query($con, $query);
$rows = mysqli_fetch_all($result, MYSQLI_ASSOC); 

// Check if file location is writeable
$fp = fopen('file.csv', 'w');

// Use ';' as delimiter for the German language version of excel
// Standard delimiter is ','
foreach ($rows as $val) {
    fputcsv($fp, $val, ';');
}

fclose($fp);
// -------------------

