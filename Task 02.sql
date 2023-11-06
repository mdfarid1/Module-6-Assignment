-- orders table create and data insert

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `orders` (
  `ORDER_ID` int NOT NULL,
  `CUST_ID` int NOT NULL,
  `ORDER_DATE` date DEFAULT NULL,
  `TOTAL_AMOUNT` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `orders` (`ORDER_ID`, `CUST_ID`, `ORDER_DATE`, `TOTAL_AMOUNT`) VALUES
(1, 1, '2003-07-30', 100),
(2, 1, '2003-07-30', 348),
(3, 2, '2003-07-30', 102),
(4, 3, '2003-07-30', 23),
(5, 4, '2003-07-30', 216),
(6, 3, '2003-07-30', 485),
(7, 4, '2003-07-30', 340),
(8, 5, '2003-07-30', 378);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`);
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;
-- end orders table create and data insert



-- order_items table create and data insert
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `order_items` (
  `ORDER_ITEM_ID` varchar(255) NOT NULL,
  `ORDER_ID` int NOT NULL,
  `PRODUCT_ID` int NOT NULL,
  `QUANTITY` float DEFAULT NULL,
  `UNIT_PRICE` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `order_items` (`ORDER_ITEM_ID`, `ORDER_ID`, `PRODUCT_ID`, `QUANTITY`, `UNIT_PRICE`) VALUES
('1', 1, 1, 2, 50),
('2', 2, 2, 3, 34),
('3', 1, 3, 4, 87),
('4', 2, 4, 1, 23),
('5', 4, 5, 4, 85),
('6', 4, 6, 6, 63),
('7', 3, 7, 9, 24),
('8', 3, 8, 5, 97);

ALTER TABLE `order_items`
  ADD PRIMARY KEY (`ORDER_ITEM_ID`);
COMMIT;
-- end order_items table create and data insert




-- Tast 02 :
-- Write a SQL query to retrieve the product name, quantity, and total amount for each order item. Display the result in ascending order of the order ID.
SELECT
    orders.ORDER_ID,
    products.NAME,
     order_items.QUANTITY,
     order_items.UNIT_PRICE * order_items.QUANTITY AS total_amount
FROM
    orders 
JOIN
    order_items ON orders.ORDER_ID = order_items.ORDER_ID
JOIN
    products  ON order_items.PRODUCT_ID = products.PRODUCT_ID
ORDER BY
    orders.ORDER_ID ASC;


