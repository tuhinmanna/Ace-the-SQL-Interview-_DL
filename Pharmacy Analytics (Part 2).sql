SELECT manufacturer, count(manufacturer) as drug_count,
sum(cogs - total_sales) as total_loss
FROM pharmacy_sales
where total_sales < cogs
group by 1
order by 3 desc ;
