select 'dropping user rt_user' as 'installation starting';

drop user
IF exists 'rt_user'@'localhost';

select 'adding user rt_user' as 'installation progressing';

create user
if not exists 'rt_user'@'localhost'
identified by 'super_secret_pswd_911'
failed_login_attempts 4
password_lock_time 10
password expire interval 90 day
password history 5
password reuse interval 365 day;

revoke all, grant option from 'rt_user'@'localhost';

grant all on *.*
to 'rt_user'@'localhost';
select user, show_db_priv, account_locked
from mysql.user;

select 'completed adding rt_user' as 'installation done';

select 'dropping user brt_user' as 'installation started';

drop user
if exists 'brt_user'@'localhost';

select 'adding user brt_user'as 'installation progressing';

create user
if not exists 'brt_user'@'localhost'
identified by 'super_secret_pswd_911'
failed_login_attempts 0
password_lock_time 0
password expire interval 90 day
password history 5
password reuse interval 365 day;

revoke all, grant option from 'brt_user'@'localhost';

grant all on *.*
to 'brt_user'@'localhost';

select 'completed' as 'installation done';
flush privileges;

select user, host, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_007' as 'installation started'

drop user
if exists 'admin_007'@'%'

select 'adding user admin_007' as 'installation progressing';
create user
if not exists 'admin_007'@'%'
identified by 'guttmangrizzlies_2024'
failed_login_attempts 4
password_lock_time unbounded
password expire interval 90 day
password history 5
password reuse interval 365 day;


revoke all, grant option from 'admin_007'@'%'

select user, show_db_priv, account_locked
from mysql.user;

grant select on classicmodels.*
  to'admin_007'@'%';

select 'added user admin_007' as 'installation completed';

flush privileges;
