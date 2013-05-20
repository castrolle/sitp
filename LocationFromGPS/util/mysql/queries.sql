SELECT b.`number` as bus,b.`id_route` as ruta, d.name as nombre, 
d.family_name as apellido, p.latitude as latitud, p.longitude as longitud, 
p.date as fecha, p.hour as hora FROM `bus` b 
INNER JOIN `bus_driver` bd ON b.id = bd.id_bus
INNER JOIN `driver` d ON d.id = bd.id_driver
INNER JOIN `position` p ON p.id_bus = b.id