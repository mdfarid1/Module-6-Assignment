-- customers table create and data insert
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE TABLE `customers` (
  `CUST_ID` int NOT NULL,
  `NAME` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `LOCATION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `customers` (`CUST_ID`, `NAME`, `EMAIL`, `LOCATION`) VALUES
(1, 'farid', 'farid@gmail.com', 'Dhaka'),
(2, 'arif', 'arif@gmail.com', 'uttara'),
(3, 'nahid', 'nahid@gmail.com', 'Khulna'),
(4, 'Jahid', 'jahid@gmail.com', 'Dhaka'),
(5, 'Mizbah', 'mizbah@gmail.com', 'Sylhet'),
(6, 'Arafat', 'arafat@gmail.com', 'sreepur'),
(7, 'Niloy', 'niloy@gmail.com', 'Tongi'),
(8, 'Arifin', 'arifin@gmail.com', 'Gazipur');
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CUST_ID`);
ALTER TABLE `customers`
  MODIFY `CUST_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;
-- end customers table create and data insert



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
(1, 1, '2003-07-30', 300),
(2, 1, '2003-07-30', 100),
(3, 2, '2003-07-30', 700),
(4, 3, '2003-07-30', 500),
(5, 4, '2003-07-30', 170),
(6, 3, '2003-07-30', 340),
(7, 4, '2003-07-30', 478),
(8, 5, '2003-07-30', 294);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`ORDER_ID`);
ALTER TABLE `orders`
  MODIFY `ORDER_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;
-- end orders table create and data insert




-- Task 04 :
-- Write a SQL query to retrieve the top 5 customers who have made the highest total purchase amount. Display the customer name along with the total purchase amount in descending order of the purchase amount.

SELECT
    customers.NAME,
    SUM(order_items.UNIT_PRICE * order_items.QUANTITY) AS total_purchase_amount
FROM
    customers 
JOIN
    orders  ON customers.CUST_ID = orders.CUST_ID
JOIN
    order_items  ON orders.ORDER_ID = order_items.ORDER_ID
GROUP BY
    customers.NAME
ORDER BY
    total_purchase_amount DESC
LIMIT 5;