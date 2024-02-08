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

Given that the goods in Warehouses B and C are of identical size, it makes practical sense to consolidate them. Warehouse B, offering a greater total capacity than Warehouse C, emerges as the optimal choice for this consolidation effort. To facilitate this process, it is necessary to clear out space in Warehouse B, which is currently taken up by products with low sales volumes. This examination should extend to similar items within Warehouse C as well. Thus, my strategy involves devising a plan to integrate these items into Warehouse B by decreasing the inventory of low-turnover products from both Warehouses B and C. It's imperative to acknowledge that Warehouse C's inventory includes vintage cars, which are known to increase in value and demand over time. Therefore, a thorough market analysis and assessment of each vehicle's potential is essential prior to undertaking any optimization measures. This approach ensures that the consolidation not only maximizes space utilization but also aligns with strategic sales and inventory management objectives.

###For Example: Products with High Inventory but Low Sales Volume in Warehouses B and C

| productCode | productName |warehouseCode | quantityInStock | quantityOrdered|
| :--------:  | :----------:| :----------:| :-----------:| :-----------------:|
|S10_1949|"1952 Alpine Renault 1300"|b|7305|961|
|S10_4962|"1962 LanciaA Delta 16V"|b|6791|932|
|S12_3148|"1969 Corvair Monza"|b|6906|963|
|S12_3380|"1968 Dodge Charger"|b|9123|925|
|S12_4675|"1969 Dodge Charger"|b|7323|992|
|S18_1129|"1993 Mazda RX-7"|b|3975|947|
|S18_1984|"1995 Honda Civic"|b|9772|917|
|S18_3482|"1976 Ford Gran Torino"|b|9127|915|
|S18_3685|"1948 Porsche Type 356 Roadster"|b|8990|948|
|S24_1444|"1970 Dodge Coronet"|b|4074|976|
|S24_1628|"1966 Shelby Cobra 427 S/C"|b|8197|915|
|S24_2972|"1982 Lamborghini Diablo"|b|7723|912|
|S24_3191|"1969 Chevrolet Camaro Z28"|b|4695|870|
|S24_3371|"1971 Alpine Renault 1600s"|b|7995|969|
|S18_3320|"1917 Maxwell Touring Car"|c|7913|992|
|S18_4522|"1904 Buick Runabout"|c|8290|990|
|S18_4668|"1939 Cadillac Limousine"|c|6645|995|
|S24_1937|"1939 Chevrolet Deluxe Coupe"|c|7332|937|
|S24_3151|"1912 Ford Model T Delivery Wagon"|c|9173|991|
|S24_3420|"1937 Horch 930V Limousine"|c|2902|884|
|S24_3816|"1940 Ford Delivery Sedan"|c|6621|923|
|S24_3969|"1936 Mercedes Benz 500k Roadster"|c|2081|824|
|S24_4258|"1936 Chrysler Airflow"|c|4710|983|



