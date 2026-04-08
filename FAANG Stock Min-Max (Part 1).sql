SELECT DISTINCT ticker
,  FIRST_VALUE(TO_CHAR(date, 'Mon-yyyy')) OVER(PARTITION BY ticker ORDER BY open DESC) AS highest_mth
,  MAX(open) OVER(PARTITION BY ticker) AS highest_open
,  LAST_VALUE(TO_CHAR(date, 'Mon-yyyy')) 
OVER(PARTITION BY ticker ORDER BY open desc range between UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING) AS lowest_mth
,  MIN(open) OVER(PARTITION BY ticker) AS lowest_open
FROM stock_prices
ORDER BY 1
