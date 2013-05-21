<?php
$method = $_SERVER['REQUEST_METHOD'];

$link = mysql_connect("mysql10.000webhost.com", "a7024518_bus", "Asdf1234*") or die("Could not connect");
mysql_select_db("a7024518_bus") or die("Could not select database");
 
//Test    http://127.0.0.1:81/gpsjson/add_position.php?bus=123&longitude=111&latitude=2222
 

switch ($method) {
	case 'GET':
	date_default_timezone_set('America/Bogota');
        $date_string = date('d-m-Y');
	$hour_string = date('H:i:s');

	if(isset($_GET['bus']) && isset($_GET['longitude']) && isset($_GET['latitude'])){
	
	 	
	 	$sql = "SELECT id FROM `bus` WHERE `number` = '$_GET[bus]'";
	 	$resulset = mysql_query($sql);		
		$id_bus = 0;
		
	 	while ($obj = mysql_fetch_object($resulset)) {			
				$id_bus = $obj->id;
		}	 	
	
echo $id_bus;
		if($id_bus != 0){
	        $sql = "INSERT INTO position (id_bus,longitude,latitude,date,hour) VALUES ('$id_bus','$_GET[longitude]','$_GET[latitude]',STR_TO_DATE('$date_string','%d-%m-%Y'),'$hour_string')";
			mysql_query($sql);
		}
	}	
	break;
}

mysql_close($link);
?>		