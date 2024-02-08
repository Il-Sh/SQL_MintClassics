# Project Scenario 

Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of their storage facilities. 

To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. For example, they would like to be able to ship a product to a customer within 24 hours of the order being placed.

## Project Objectives

1. Explore products currently in inventory.

2. Determine important factors that may influence inventory reorganization/reduction.

3. Provide analytic insights and data-driven recommendations.

 ## Goal
 
 The goal is find answers to the following question in order to address the needs for inventory reduction and closing up of warehouses
 
 1) Where are items stored and if they were rearranged, could a warehouse be eliminated?

2) How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

3) Are we storing items that are not moving? Are any items candidates for being dropped from the product line?

## The following data are produced using SQL queries:
###  Total quantity of items in each warehouse and calculation of total capacity

| warehouseName | warehouseCode | NumberOfProducts | TotalInventory| warehousePctCap | TotalCapacity |
| :------------:| :---------------:| :-------------:|  :-------------:| :------------:|  :-----------:|
| North | a | 25 | 131688 | 72 | 182900 |
| East  | b | 38 |219183  | 67 | 327139 |
| West  | c | 24 |124880  | 50 | 249760 |
| South | d | 23 |79380   | 75 | 105840 |

From the data presented, it can be deduced that Warehouse D is notably the smallest, both in terms of its capacity and the volume of inventory it holds. However, given that the data available does not detail the physical dimensions of each warehouse, I aim to gauge the size of each warehouse by analyzing the variety of product types stored within them.

### Product Lines Stored at Each Warehouse

|warehouseCode|warehouseName|productLine|
| :------------:| :---------------:| :-------------:|
| a | North | Motorcycles|
| a | North | Planes |
| b | East  | "Classic Cars" |
| c | West  | "Vintage Cars" |
| d | South | Ships |
| d | South | Trains |
| d | South | "Trucks and Buses" |

Due to the fact that the products stored in Warehouse D are very bulky, I question the feasibility of its closure and redistribution, just as with Warehouse A, which stores airplanes. Bulky and specific items, such as airplanes, require special storage conditions, making their relocation and redistribution less practical. Based on the table above, my decision would be to merge Warehouses B and C

Considering that the products of Warehouse B & C are of the same size, it would be prudent to co-locate them. Warehouse B, with its greater overall capacity compared to Warehouse C, emerges as the more suitable location for this consolidation. To facilitate this merger, it will be necessary to clear space in Warehouse B currently occupied by products with low sales levels. It is also feasible to review similar items in Warehouse C; however, given that the goods in Warehouse C are vintage cars, which are known to generally increase in value and demand, I would prefer to retain them at this stage despite the low sales volume. Therefore, I will seek a way to consolidate all these goods in Warehouse B by displacing the low-sales-volume items from Warehouse B.
