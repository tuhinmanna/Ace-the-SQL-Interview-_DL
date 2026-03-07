SELECT user_id
from emails e inner join texts t 
on e.email_id = t.email_id 
where datediff(t.action_date, e.signup_date) = 1 AND
t.signup_action = 'Confirmed'
