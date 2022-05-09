SELECT * FROM jardineria.detalle_pedido;
SELECT * FROM jardineria.pedido;
SELECT * FROM jardineria.producto;

SELECT nombre_contacto, telefono, pais 
FROM jardineria.cliente
WHERE pais LIKE 'Spain';

SELECT nombre, CONCAT(apellido1,' ',apellido2) AS apellidos, email
FROM jardineria.empleado
WHERE codigo_jefe = 7;


SELECT nombre_contacto, apellido_contacto, forma_pago, FIRST_VALUE(fecha_pago) OVER (ORDER BY fecha_pago) AS Primera, LAST_VALUE(fecha_pago) OVER (ORDER BY fecha_pago) AS Ultima FROM jardineria.Cliente
INNER JOIN jardineria.pago ON pago.codigo_cliente = cliente.codigo_cliente
GROUP BY cliente.codigo_cliente;

SELECT producto.nombre, detalle_pedido.cantidad, (precio_unidad * cantidad) AS Total, (((precio_unidad * cantidad) * 0.21) + (precio_unidad * cantidad)) AS TotalIVA 
FROM jardineria.producto
INNER JOIN jardineria.detalle_pedido ON detalle_pedido.codigo_producto = producto.codigo_producto
WHERE (precio_unidad * cantidad) > 3000;

SELECT nombre, cantidad_en_stock 
FROM jardineria.producto
ORDER	BY cantidad_en_stock DESC LIMIT 1;

SELECT nombre, precio_venta 
FROM jardineria.producto
ORDER	BY precio_venta DESC LIMIT 1;

SELECT nombre_cliente
FROM jardineria.cliente
WHERE cliente.codigo_cliente NOT IN 
(SELECT cliente.codigo_cliente FROM jardineria.cliente inner JOIN jardineria.pedido ON cliente.codigo_cliente = pedido.codigo_cliente);

SELECT nombre 
FROM jardineria.producto
WHERE producto.codigo_producto NOT IN
(SELECT producto.codigo_producto FROM jardineria.producto INNER JOIN jardineria.detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto);


