-- drop database

select '' as 'installation starting'\G

drop database if exists guttman_202db_assiagn5;
-- create database
create database if not exists guttman_202db_assiagn5
  character set utf8mb4 collate utf8mb4_0900_ai_ci;

  show databases \G

  -- use database
  use guttman_202db_assiagn5;

  -- create tables
  drop table
  if exists
  `vendor`;

create table
if not exists vendor ( vendorId char(2) not null,
                       vendorName varchar(25) not null,
                                  primary key (vendorId)
);
show create table vendor \G

drop table
if exists
`category`;

create table
  if not exists category (  categoryId char(2) not null,
                            categoryName varchar(25) not null,
                                          primary key (categoryId)
);
show create table category \G

drop table
if exists
`product`;

create table
  if not exists product (     productId     char(3) not null,
                              productName   varchar(25) not null,
                              productprice  numeric (7,2) not null,
                              vendorId      char(2) not null,
                              categoryId    char(2) not null,
                                            primary key (productId),
                                            foreign key (vendorId)
                                            references vendor(vendorId),
                                            foreign key (categoryId)
                                           references category(categoryId)   ) ;
show create table product \G

drop table
if exists
`region`;

create table
  if not exists region (      regionId    char not null,
                              regionName  varchar(25) not null,
                                          primary key (regionId)
);

show create table region \G
drop table
if exists
`store`;

create table
  if not exists store (     storeId    varchar(3) not null,
                            storeZip   char(5) not null,
                            regionId   char not null,
                                       primary key (storeId),
                                       foreign key (regionId)
                                       references region(regionId)
);
show create table store \G

drop table
if exists
`customer`;


create table
  if not exists customer (    customerid    char(7) not null,
                              customerName  varchar(15) not null,
                              customerZip   char(5) not null,
                                            primary key (customerId)
);
show create table customer \G

drop table
if exists
`salestransaction`;
create table
  if not exists salestransaction (  tid    varchar(8) not null,
                                    customerId char(7) not null,
                                    storeId  varchar(3) not null,
                                    tdate   date not null,
                                            primary key (tid),
                                            foreign key (customerId)
                                            references customer(customerId),
                                            foreign key (storeId)
                                            references  store(storeId)
);
show create table salestransaction \G
drop table
if exists
`soldvia`;

create table
  if not exists soldvia (       productId   char(3) not null,
                                tid         varchar(8) not null,
                                noofitems   int not null,
                                            primary key (productId, tid),
                                            foreign key (productId)
                                            references product(productId),
                                            foreign key (tid)
                                            references salestransaction(tid)
);
show create table soldvia \G

select '' as 'inserting values into table' \G

insert into vendor values ('pg', 'pacifica gear');
insert into vendor values ('mk', 'mountain king');

insert into category values ('cp', 'camping');
insert into category values ('fw', 'footwear');

insert into product values ('1x1', 'zzz bad',100,'pg','cp');
insert into product values ('2x2', 'easy boot',70,'mk','fw');
insert into product values ('3x3', 'cosy sock',15,'mk','fw');
insert into product values ('4x4', 'dura boot',90,'pg','fw');
insert into product values ('5x5', 'tiny tent',150,'mk','cp');
insert into product values ('6x6', 'biggy tent',250,'mk','cp');


insert into region values ('c','chicagoland');
insert into region values ('t','tristate');

insert into store values ('s1','60600','c');
insert into store values ('s2','60605','c');
insert into store values ('s3','35400','t');
insert into store values ('s4', '68419','t');
insert into store values ('s5', '12345','t');

insert into customer values ('1-2-333','tina','60137');
insert into customer values ('2-3-444','tony','60611');
insert into customer values ('3-4-555','tina','35401');

insert into salestransaction values ('t111','1-2-333','s1','2013-01-01');
insert into salestransaction values ('t222','2-3-444','s2','2013-01-01');
insert into salestransaction values ('t333','1-2-333','s3','2013-01-02');
insert into salestransaction values ('t444','3-4-555','s4','2013-01-02');
insert into salestransaction values ('t555','2-3-444','s5','2013-01-02');

insert into soldvia values ('1x1', 't111',1);
insert into soldvia values ('2x2', 't222',1);
insert into soldvia values ('3x3', 't333',5);
insert into soldvia values ('1x1', 't333',1);
insert into soldvia values ('4x4', 't444',1);
insert into soldvia values ('2x2', 't444',2);
insert into soldvia values ('4x4', 't555',4);
insert into soldvia values ('5x5', 't555',2);
insert into soldvia values ('6x6', 't555',1);

select '' as 'installation completed' \G
