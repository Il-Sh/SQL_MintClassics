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

From the data presented, it can be inferred that Warehouse D has the distinction of being the smallest in terms of both physical capacity and inventory volume.
