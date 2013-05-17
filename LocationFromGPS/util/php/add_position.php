<?php
$method = $_SERVER['REQUEST_METHOD'];

$link = mysql_connect("mysql10.000webhost.com", "a7024518_bus", "Asdf1234*") or die("Could not connect");
mysql_select_db("a7024518_bus") or die("Could not select database");
 
//Test    http://127.0.0.1:81/gpsjson/add_position.php?bus=123&longitude=111&latitude=2222
 


// Dependiendo del método de la petición ejecutaremos la acción correspondiente.
switch ($method) {
	case 'GET':
	date_default_timezone_set('America/Bogota');
        $date_string = date('d-m-Y');
	$hour_string = date('H:i:s');

	if(isset($_GET['bus']) && isset($_GET['longitude']) && isset($_GET['latitude'])){
                $sql = "INSERT INTO position (bus_id,longitude,latitude,date,hour) VALUES ('$_GET[bus]','$_GET[longitude]','$_GET[latitude]',STR_TO_DATE('$date_string','%d-%m-%Y'),'$hour_string')";
		mysql_query($sql);
	}	
	break;
}
mysql_close($link);
?>		