select 7 as mnt, count(*) as monthly_active_users from (
SELECT user_id
    FROM user_actions
    WHERE event_date >= DATE '2022-06-01'
      AND event_date <  DATE '2022-08-01'
      AND event_type IN ('sign-in', 'like', 'comment')
    GROUP BY user_id
    HAVING COUNT(DISTINCT DATE_TRUNC('month', event_date)) = 2
    ) t
