### Top 5 Sales_man
select salesman_name, SUM(Actual_sales) sales from Transaction t inner join salesman s on t.Salesman_ID = s.salesman_ID 
group by salesman_name order by sales desc limit 5;

### Store Wise Sales
select s.store_id, sum(actual_sales) store_sales from stores s inner join transaction t on s.store_id = t.store_id 
group by store_id order by store_sales desc;

### Target Vs Actual Sales
select s.salesman_name, sum(t.Actual_sales) Actual_sales, round(sum(t.Target_Sales)) Target_Sales from transaction t inner join salesman s on s.salesman_id = t.salesman_id
group by s.salesman_name order by salesman_name;

### Target Vs Actual Visit
select s.salesman_name, round(sum(t.Actual_visits)) Actual_visit, round(sum(t.Target_visits)) Target_visit from transaction t inner join salesman s 
on s.salesman_id = t.salesman_id group by s.salesman_name order by salesman_name;

###  SKU Performance
select s.SKU_Type, sum(Actual_Sales) Actual_Sales from transaction t inner join sku s on t.sku_code = s.sku_code 
group by s.SKU_Type order by Actual_Sales desc;

###  Retailor Performance
select s.Retailer_Name, sum(Actual_Sales) Actual_Sales from transaction t inner join stores s on t.store_id = s.store_id
group by s.Retailer_Name order by Actual_Sales desc;

### Period Wise Performance 
select p.Seasons, sum(Actual_Sales) Actual_Sales from period p inner join transaction t on t.period_id = p.period group by p.Seasons 
order by Actual_Sales desc;

### Geographical Sales 
select r.region, (sum(Actual_Sales)/(select sum(Actual_Sales) from transaction))*100 Sales_Percentage from region r inner join transaction t on t.city_id = r.city_id group by r.region
order by Actual_Sales desc;





