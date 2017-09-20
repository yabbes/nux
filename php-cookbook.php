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