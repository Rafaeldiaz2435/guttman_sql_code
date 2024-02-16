create database admin_005_a;
  use admin_005_a;
drop table if EXISTS
`categories`;
create table categories(
  `categoryId` int auto_increment primary key,
  `categoryName` varchar(100) unique not NULL
);

show create table categories \G

drop table if exists
  `vendors`;
create table vendors(
  `vendorId` int auto_increment primary key,
  `vendorName` varchar(25) unique not null
);
show create table vendors \G
drop table if EXISTS
  `products`;
create table `products`(
  `productId` int auto_increment primary key,
  `productName` varchar(100) unique not null,
  `categoryId` int,
  `vendorId` int,

  CONSTRAINT `fk_category`
    FOREIGN Key(categoryId)
    REFERENCES categories(categoryId),
    CONSTRAINT `fk_vendors`
    FOREIGN KEY(vendorId)
    REFERENCES vendors(vendorId)
);

show create table products \G

drop table if exists `departments`;
create table `departments` (
`deptId` int auto_increment primary key,
`deptname` varchar(50) unique
);
show create table departments \G
