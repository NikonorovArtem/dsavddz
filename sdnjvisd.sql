SELECT DISTINCT customers.company_name,
       CONCAT(employees.first_name, ' ', employees.last_name) AS employee_name
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
JOIN employees ON orders.employee_id = employees.employee_id
JOIN shippers ON orders.ship_via = shippers.shipper_id
WHERE customers.city = 'London'
  AND employees.city = 'London'
  AND shippers.company_name = 'United Package';

SELECT products.product_name,
products.units_in_stock,
suppliers.contact_name,
suppliers.phone
FROM products
JOIN suppliers ON products.supplier_id = suppliers.supplier_id
JOIN categories ON products.category_id = categories.category_id
WHERE products.discontinued = 0 
AND units_in_stock < 25
AND categories.category_name IN ('Dairy Products', 'Condiments')
ORDER BY products.units_in_stock ASC;

SELECT company_name 
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

SELECT DISTINCT product_name
FROM products
WHERE product_id IN (
  SELECT product_id
  FROM order_details
  WHERE quantity = 10
);