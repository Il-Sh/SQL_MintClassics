-- Explore Products Currently in Inventory--
SELECT p.productCode, p.productName, p.quantityInStock, w.warehouseName
FROM products p
JOIN warehouses w ON p.warehouseCode = w.warehouseCode;

-- The calculation of total capacity -
SELECT w.warehouseName,w.warehouseCode,COUNT(p.productCode) AS NumberOfProducts, SUM(p.quantityInStock) AS TotalInventory,
    w.warehousePctCap,ROUND((SUM(p.quantityInStock) / w.warehousePctCap) * 100) AS TotalCapacity
FROM warehouses w
JOIN products p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode;

-- Product Lines Stored at Each Warehouse --
SELECT w.warehouseCode,w.warehouseName,p.productLine
FROM warehouses w
JOIN products p ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseCode, w.warehouseName, p.productLine
ORDER BY w.warehouseCode, p.productLine;

-- Analyze the Relationship Between Inventory and Sales --
SELECT p.productCode, p.productName, p.quantityInStock, SUM(od.quantityOrdered) AS totalSold
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName, p.quantityInStock;

-- Analyzing sales and inventory data is essential for effective inventory replenishment planning --
SELECT p.productCode, p.productName, p.quantityInStock, 
       SUM(od.quantityOrdered) AS totalQuantityOrdered, 
       (p.quantityInStock - SUM(od.quantityOrdered)) AS difference
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY p.productCode, p.productName
HAVING difference < 0;

-- Identify Products That Aren't Selling --
SELECT p.productCode, p.productName, p.quantityInStock, IFNULL(SUM(od.quantityOrdered), 0) AS totalSold,w.warehouseName
FROM products p
LEFT JOIN orderdetails od ON p.productCode = od.productCode
JOIN warehouses w ON w.warehouseCode = p.warehouseCode
GROUP BY p.productCode, p.productName, p.quantityInStock
HAVING totalSold = 0;


-- Analyze the Relationship Between Inventory and Sales in the east & west  warehouse --
SELECT p.productCode, p.productName, p.quantityInStock, SUM(od.quantityOrdered) AS totalSold
FROM products p
JOIN orderdetails od ON p.productCode = od.productCode
JOIN warehouses w ON  w.warehouseCode = p.warehouseCode
WHERE w.warehouseName ='east' OR w.warehouseName ='west'
GROUP BY p.productCode, p.productName, p.quantityInStock;


    
-- Query for Products with Stock Levels at Least Double the Ordered Quantity in the each warehouse --
SELECT p.productCode,p.productName,w.warehouseCode,p.quantityInStock,IFNULL(SUM(od.quantityOrdered), 0) AS totalQuantityOrdered
FROM products p
INNER JOIN warehouses w ON p.warehouseCode = w.warehouseCode
LEFT JOIN orderdetails od ON p.productCode = od.productCode
WHERE w.warehouseCode = 'b' OR  w.warehouseCode = 'c'
GROUP BY p.productCode
HAVING p.quantityInStock >= 2 * totalQuantityOrdered;

-- Total Profit --
SELECT p.warehouseCode,SUM((od.priceEach - p.buyPrice) * od.quantityOrdered) AS totalProfit
FROM orderdetails od
JOIN products p ON od.productCode = p.productCode
GROUP BY p.warehouseCode;


-- Analysis of Average Delivery Time by Warehouse --
SELECT p.warehouseCode,AVG(DATEDIFF(o.shippedDate, o.orderDate)) AS averageDeliveryTime
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
WHERE o.shippedDate IS NOT NULL
GROUP BY p.warehouseCode
ORDER BY averageDeliveryTime DESC;

    


 
