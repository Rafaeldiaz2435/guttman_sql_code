drop user
if exists 'admin_001'@'%';

select 'adding user admin_001' as 'installation progressing';

create user
if not exists 'admin_001'@'%'
identified by 'guttmangrizzlies_2024'

with
-- set resource limits
max_queries_per_hour 20
max_updates_per_hour 10
max_connections_per_hour 5
max_user_connections 2

-- set password options
failed_login_attempts 4
password_lock_time unbounded
password expire interval 90 day
password history 5
password reuse interval 365 day;

revoke all, grant option from 'admin_001'@'%';

select user, show_db_priv, account_locked
from mysql.user;

flush privileges;

select user, show_db_priv, account_locked
from mysql.user;
