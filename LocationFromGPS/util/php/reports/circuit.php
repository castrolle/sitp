<?php
$method = $_SERVER['REQUEST_METHOD'];


$link = mysql_connect("mysql10.000webhost.com", "a7024518_bus", "Asdf1234*") or die("Could not connect");
mysql_select_db("a7024518_bus") or die("Could not select database");
 
$sql = "SELECT @curRow := @curRow + 1 AS vuelta,`bus`,`ruta`,`nombre`,`apellido`,`latitud`,`longitud`,`fecha`,`hora`FROM `view_circuit` INNER JOIN (SELECT @curRow := 0) r";

 
$resulset = mysql_query($sql);
 
$response = array();

while($obj = mysql_fetch_object($resulset )) {
      $response [] = $obj;
}

// add the header line to specify that the content type is JSON
header("Content-type: application/json");

echo "{\"data\":" .json_encode($response ). "}";
mysql_close($link);
?>
