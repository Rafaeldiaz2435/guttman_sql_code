select 'dropping user admin_001' as 'installation progressing';

drop user
if exists 'admin_001'@'%';

select 'adding user admin_001' as ' installation progressing';
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

select user, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_002' as 'installation progressing';

drop user
if exists 'admin_002'@'%';

select 'adding user admin_002' as ' installation progressing';
create user
if not exists 'admin_002'@'%'
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

select user, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_003' as 'installation progressing';

drop user
if exists 'admin_003'@'%';

select 'adding user admin_003' as ' installation progressing';
create user
if not exists 'admin_003'@'%'
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

select user, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_004' as 'installation progressing';

drop user
if exists 'admin_004'@'%';

select 'adding user admin_004' as ' installation progressing';
create user
if not exists 'admin_004'@'%'
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

select user, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_005' as 'installation progressing';

drop user
if exists 'admin_005'@'%';

select 'adding user admin_005' as ' installation progressing';
create user
if not exists 'admin_005'@'%'
identified by 'guttmangrizzlies_2024'
with
-- set resource limits
max_queries_per_hour 20
max_updates_per_hour 10
max_connections_per_hour 500
max_user_connections 2
-- set password options
failed_login_attempts 4
password_lock_time unbounded
password expire interval 90 day
password history 5
password reuse interval 365 day;

select user, show_db_priv, account_locked
from mysql.user;

select 'dropping user admin_006' as 'installation progressing';

drop user
if exists 'admin_006'@'%';

select 'adding user admin_006' as ' installation progressing';
create user
if not exists 'admin_006'@'%'
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

select user, show_db_priv, account_locked
from mysql.user;

select 'adding roles ' as 'installation progressing';
-- create role
create role
  if not exists
  'read_only_classicmodels_db',
  'admin_user',
  'read_only_classicmodels_db',
  'app_user';

  select user, show_db_priv, account_locked
  from mysql.user;

  -- grant privileges
  grant select
  on classicmodels.*
  to 'read_only_classicmodels_db'@'%';

grant create, drop
on employees.*
to 'admin_user'@'%';

grant create, drop
on classicmodels.*
to 'admin_user'@'%';

grant show databases
on *.*
to 'admin_user'@'%';

grant insert, update
on employees.employees
to 'app_user'@'%';

grant select
on employees.*
to 'read_only_employees_db'@'%';

select user, show_db_priv, account_locked
from mysql.user;

-- create roles
select 'creating roles' as 'installation progressing';
grant 'admin_007' to 'admin_006';

grant 'read_only_classicmodels_db' to 'admin_001', 'admin_003';

grant 'read_only_employees_db' to 'admin_002', 'admin_004';

grant 'app_user' to 'admin_006';

grant 'admin_user' to 'admin_005';

grant all privileges on guttman_202db_assiagn4.* to 'admin_005'@'%';
grant all privileges on classicmodels.* to 'admin_003'@'%';

flush privileges;

-- create roles
select 'enabling roles' as 'installation progressing';

set default
role all to  'admin_001'@'%', 'admin_002'@'%',
              'admin_003'@'%', 'admin_004'@'%',
              'admin_005'@'%', 'admin_006'@'%';


-- create roles
select 'script done' as 'installation progressing';
