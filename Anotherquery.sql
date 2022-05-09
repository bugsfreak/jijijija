SELECT nombre 
FROM jardineria.producto
WHERE producto.codigo_producto NOT IN
(SELECT producto.codigo_producto FROM jardineria.producto INNER JOIN jardineria.detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto);

SELECT * FROM jardineria.cliente;
SELECT * FROM jardineria.pago;

SELECT oficina.codigo_oficina, ciudad, COUNT(codigo_empleado) AS NumEmpleados
FROM jardineria.oficina
INNER JOIN jardineria.empleado ON oficina.codigo_oficina = empleado.codigo_oficina
GROUP BY empleado.codigo_oficina;

SELECT nombre_contacto, apellido_contacto, SUM(total) 
FROM jardineria.cliente
INNER JOIN jardineria.pago ON cliente.codigo_cliente = pago.codigo_cliente
GROUP BY cliente.codigo_cliente;