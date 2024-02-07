drop table if exists
 'categories';
create table categories(
  'categoryId' int auto_increment primary key,
  'categoryName' varchar(100) unique not null
);

show create table categories \G

drop table if exists
  'vendors';
create table vendors (
  'vendorId' int auto_increment primary key,
  'vendorName' varchar(25) unique not null
);

show create table vendors \G
drop table if exists
 'products';
create table 'products' (
  'productId' int auto_increment primary key,
  'productName' varchar(100) unique not null,
  'categoryId' int,
  'vendorId' int,

  constraint 'fk_category'
    foreign key (categoryId)
    references categories(categoryId),
  constraint 'fk_vendors'
    foreign key (vendorId)
    references vendors(vendorId)
);

show create table products \G

drop table if exists 'departments';
create table departments (
  'deptId' int auto_increment primary key,
  'deptName' varchar(50) unique
);
show create table departments \G
