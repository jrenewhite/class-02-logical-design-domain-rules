-- Datos pequenos y legibles para la Clase 02.
-- Escenario: FamilyMarket.

BEGIN;

TRUNCATE TABLE
  shipments,
  payments,
  order_items,
  orders,
  products,
  customers
RESTART IDENTITY CASCADE;

INSERT INTO customers (customer_id, full_name, email, segment, active, created_at) VALUES
  (1, 'Ana Martinez', 'ana@example.com', 'enterprise', TRUE, '2025-01-10'),
  (2, 'Bruno Garcia', 'bruno@example.com', 'smb', TRUE, '2025-02-14'),
  (3, 'Carla Lopez', 'carla@example.com', 'consumer', TRUE, '2025-03-03'),
  (4, 'Diego Perez', 'diego@example.com', 'enterprise', TRUE, '2025-03-22'),
  (5, 'Elena Ruiz', 'elena@example.com', 'smb', TRUE, '2025-04-02'),
  (6, 'Fabio Torres', 'fabio@example.com', 'consumer', FALSE, '2025-04-20');

INSERT INTO products (product_id, product_name, category, base_price, active) VALUES
  (1, 'Canasta basica', 'grocery', 18.00, TRUE),
  (2, 'Cafe molido', 'grocery', 9.50, TRUE),
  (3, 'Termo reutilizable', 'home', 14.00, TRUE),
  (4, 'Tableta infantil', 'electronics', 95.00, TRUE),
  (5, 'Audifonos bluetooth', 'electronics', 42.00, TRUE),
  (6, 'Kit de limpieza', 'home', 12.00, TRUE),
  (7, 'Cuaderno premium', 'office', 7.00, TRUE),
  (8, 'Producto descontinuado', 'grocery', 20.00, FALSE);

INSERT INTO orders (order_id, customer_id, order_date, status, order_total) VALUES
  (1001, 1, '2026-05-02', 'created', 37.00),
  (1002, 2, '2026-05-03', 'paid', 123.00),
  (1003, 3, '2026-05-04', 'preparing', 28.00),
  (1004, 4, '2026-05-05', 'shipped', 84.00),
  (1005, 5, '2026-05-06', 'cancelled', 20.00),
  (1006, 1, '2026-05-07', 'delivered', 109.00);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price, line_total) VALUES
  (1, 1001, 1, 1, 18.00, 18.00),
  (2, 1001, 2, 2, 9.50, 19.00),
  (3, 1002, 4, 1, 95.00, 95.00),
  (4, 1002, 7, 4, 7.00, 28.00),
  (5, 1003, 6, 1, 12.00, 12.00),
  (6, 1003, 3, 1, 14.00, 14.00),
  (7, 1004, 5, 2, 42.00, 84.00),
  (8, 1005, 8, 1, 20.00, 20.00),
  (9, 1006, 4, 1, 95.00, 95.00),
  (10, 1006, 2, 1, 9.50, 9.50),
  (11, 1006, 6, 1, 4.50, 4.50);

INSERT INTO payments (payment_id, order_id, payment_date, payment_status, payment_method, amount) VALUES
  (1, 1001, NULL, 'pending', 'card', 37.00),
  (2, 1002, '2026-05-03', 'confirmed', 'card', 123.00),
  (3, 1003, '2026-05-04', 'confirmed', 'transfer', 28.00),
  (4, 1004, '2026-05-05', 'confirmed', 'card', 84.00),
  (5, 1005, '2026-05-06', 'failed', 'card', 20.00),
  (6, 1006, '2026-05-07', 'confirmed', 'card', 109.00);

INSERT INTO shipments (shipment_id, order_id, shipment_date, shipment_status, carrier, delivery_days) VALUES
  (1, 1001, NULL, 'pending', NULL, NULL),
  (2, 1002, NULL, 'pending', NULL, NULL),
  (3, 1003, '2026-05-05', 'packed', 'DHL', 1),
  (4, 1004, '2026-05-06', 'in_transit', 'Estafeta', 2),
  (5, 1005, NULL, 'cancelled', NULL, NULL),
  (6, 1006, '2026-05-08', 'delivered', 'FedEx', 1);

COMMIT;
