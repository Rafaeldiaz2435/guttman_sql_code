-- drop roles
drop role
if exists 'read_only-classicmodels_db'@'%';

-- check to see gone
select user, show_db_priv, account_locked
from mysql.user;

-- create role
create role
  if not EXISTS
  'read_only_classicmodels_db', 'admin_user',
  'read_only_employees_db', 'app_user';

select user, show_db_priv, account_locked
from mysql.user;
