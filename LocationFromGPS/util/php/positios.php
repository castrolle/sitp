<?php
$method = $_SERVER['REQUEST_METHOD'];


$link = mysql_connect("mysql10.000webhost.com", "a7024518_bus", "Asdf1234*") or die("Could not connect");
mysql_select_db("a7024518_bus") or die("Could not select database");
 
$sql = "SELECT * FROM position";
 
$resulset = mysql_query($sql);
 
$response = array();

// Dependiendo del método de la petición ejecutaremos la acción correspondiente.
switch ($method) {
	case 'GET':
		while ($obj = mysql_fetch_object($resulset)) {
			$response[] = array('bus' => $obj->bus_id,
						   'latitude' => utf8_encode($obj->latitude),
						   'longitude' => $obj->longitude,
						   'date' => $obj->date,
						   'hour' => $obj->hour
				);
		}
		break;
}

echo json_encode($response); // $response será un array con los datos de nuestra respuesta.
mysql_close($link);
?>
