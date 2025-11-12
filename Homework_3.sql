-- RAW LAYER

create schema HW3;

CREATE OR REPLACE TABLE `HW3.raw_data_customer` (
 customer_id INT64,
 first_name STRING,
 last_name STRING,
 phone_number STRING,
 customer_email STRING
);

CREATE OR REPLACE TABLE `HW3.raw_data_book` (
 book_id INT64,
 name STRING,
 author STRING,
 pages_amount INT64,
 category STRING,
 publication_year INT64,
 language STRING,
 publisher STRING
);

CREATE OR REPLACE TABLE `HW3.raw_data_payment_date` (
 payment_id INT64,
 payment_method STRING, 
 payment_provided BOOL,
 date_id INT64,
 date DATE,
 month STRING,
 year STRING
);

CREATE OR REPLACE TABLE `HW3.raw_data_from_shop` (
 shop_id INT64,
 city STRING,
 adress STRING,
 name STRING,
 seller_id INT64,
 store_id INT64,
 first_name STRING,
 last_name STRING,
 salary INT64
);

INSERT INTO `HW3.raw_data_customer` VALUES
(1,"Anna","Brown","123456789","anna@example.com"),
(2,"John","Smith","987654321","john.smith@example.com"),
(3,"Maria","Garcia","555777888","maria@example.com"),
(4,"Alex","Johnson","444555666","alex@example.com"),
(5,"Kate","Martinez","222333444","kate@example.com"),
(6,"Tom","Williams","123123123","tom@example.com"),
(7,"Emily","Davis","555666777","emily@example.com"),
(8,"David","Miller","777888999","david@example.com"),
(9,"Sarah","Wilson","111222333","sarah@example.com"),
(10,"Chris","Moore","444111222","chris@example.com"),
(11,"Anna","Brown","123456789","anna@example.com"),
(12,"John","Smith","987654321","john.smith@example.com"),
(13,"Maria","Garcia","555777888","maria@example.com"),
(14,"Alex","Johnson","444555666","alex@example.com"),
(15,"Kate","Martinez","222333444","kate@example.com"),
(16,"Tom","Williams","123123123","tom@example.com"),
(17,"Emily","Davis","555666777","emily@example.com"),
(18,"David","Miller","777888999","david@example.com"),
(19,"Sarah","Wilson","111222333","sarah@example.com"),
(20,"Chris","Moore","444111222","chris@example.com"),
(21,NULL,"Brown","123456789",NULL),
(22,"John",NULL,"987654321","john.smith@example.com"),
(23,NULL,"Garcia","555777888","maria@example.com"),
(24,"Alex","Johnson",NULL,"alex@example.com"),
(25,"Kate","Martinez","222333444",NULL),
(26,"Tom","Williams","123123123","tom@example.com"),
(27,NULL,"Davis","555666777","emily@example.com"),
(28,"David","Miller","777888999",NULL),
(29,"Sarah","Wilson",NULL,"sarah@example.com"),
(30,NULL,"Moore","444111222","chris@example.com");

INSERT INTO `HW3.raw_data_book` VALUES
(1,"Book A","Author A",120,"Drama",1999,"English","Pub1"),
(2,"Book B","Author B",350,"SciFi",2001,"English","Pub2"),
(3,"Book C","Author C",200,"Fantasy",2010,"German","Pub3"),
(4,"Book D","Author D",450,"Drama",2005,"Spanish","Pub4"),
(5,"Book E","Author E",300,"Fantasy",2015,"English","Pub5"),
(6,"Book F","Author F",180,"Drama",2008,"Polish","Pub6"),
(7,"Book G","Author G",500,"SciFi",2020,"English","Pub7"),
(8,"Book H","Author H",250,"Drama",2004,"Russian","Pub8"),
(9,"Book I","Author I",390,"Fantasy",2011,"English","Pub9"),
(10,"Book J","Author J",220,"Drama",2009,"French","Pub10"),
(11,"Book A","Author A",120,"Drama",1999,"English","Pub1"),
(12,"Book B","Author B",350,"SciFi",2001,"English","Pub2"),
(13,"Book C","Author C",200,"Fantasy",2010,"German","Pub3"),
(14,"Book D","Author D",450,"Drama",2005,"Spanish","Pub4"),
(15,"Book E","Author E",300,"Fantasy",2015,"English","Pub5"),
(16,"Book F","Author F",180,"Drama",2008,"Polish","Pub6"),
(17,"Book G","Author G",500,"SciFi",2020,"English","Pub7"),
(18,"Book H","Author H",250,"Drama",2004,"Russian","Pub8"),
(19,"Book I","Author I",390,"Fantasy",2011,"English","Pub9"),
(20,"Book J","Author J",220,"Drama",2009,"French","Pub10"),
(21,NULL,"Author A",120,"Drama",1999,"English","Pub1"),
(22,"Book B",NULL,350,"SciFi",2001,"English","Pub2"),
(23,"Book C","Author C",NULL,"Fantasy",2010,"German","Pub3"),
(24,"Book D","Author D",450,NULL,2005,"Spanish","Pub4"),
(25,"Book E","Author E",300,"Fantasy",NULL,"English","Pub5"),
(26,"Book F","Author F",180,"Drama",2008,NULL,"Pub6"),
(27,"Book G",NULL,500,"SciFi",2020,"English","Pub7"),
(28,"Book H","Author H",250,"Drama",2004,"Russian",NULL),
(29,"Book I","Author I",390,"Fantasy",2011,NULL,"Pub9"),
(30,NULL,"Author J",220,"Drama",2009,"French","Pub10");

INSERT INTO `HW3.raw_data_payment_date` VALUES
(1,"card",TRUE,1,"2021-01-01","Jan","2021"),
(2,"cash",FALSE,2,"2021-02-02","Feb","2021"),
(3,"card",TRUE,3,"2021-03-03","Mar","2021"),
(4,"cash",TRUE,4,"2021-04-04","Apr","2021"),
(5,"card",FALSE,5,"2021-05-05","May","2021"),
(6,"cash",TRUE,6,"2021-06-06","Jun","2021"),
(7,"card",TRUE,7,"2021-07-07","Jul","2021"),
(8,"cash",FALSE,8,"2021-08-08","Aug","2021"),
(9,"card",TRUE,9,"2021-09-09","Sep","2021"),
(10,"cash",TRUE,10,"2021-10-10","Oct","2021"),
(11,"card",TRUE,1,"2021-01-01","Jan","2021"),
(12,"cash",FALSE,2,"2021-02-02","Feb","2021"),
(13,"card",TRUE,3,"2021-03-03","Mar","2021"),
(14,"cash",TRUE,4,"2021-04-04","Apr","2021"),
(15,"card",FALSE,5,"2021-05-05","May","2021"),
(16,"cash",TRUE,6,"2021-06-06","Jun","2021"),
(17,"card",TRUE,7,"2021-07-07","Jul","2021"),
(18,"cash",FALSE,8,"2021-08-08","Aug","2021"),
(19,"card",TRUE,9,"2021-09-09","Sep","2021"),
(20,"cash",TRUE,10,"2021-10-10","Oct","2021"),
(21,NULL,TRUE,11,NULL,"Jan","2021"),
(22,"cash",NULL,12,"2021-02-02","Feb",NULL),
(23,NULL,TRUE,13,"2021-03-03","Mar","2021"),
(24,"cash",TRUE,NULL,"2021-04-04","Apr","2021"),
(25,"card",NULL,15,"2021-05-05",NULL,"2021"),
(26,"cash",TRUE,16,"2021-06-06","Jun",NULL),
(27,"card",TRUE,17,NULL,"Jul","2021"),
(28,NULL,FALSE,18,"2021-08-08","Aug","2021"),
(29,"card",TRUE,NULL,"2021-09-09","Sep","2021"),
(30,NULL,NULL,20,"2021-10-10","Oct","2021");

INSERT INTO `HW3.raw_data_from_shop` VALUES
(1,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200),
(2,"Lviv","Green St 5","Shop B",12,102,"Anna","Wind",1500),
(3,"Odesa","Blue St 7","Shop C",13,103,"Bob","Stone",900),
(4,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200),
(5,"Kharkiv","Red St 9","Shop D",14,104,"Alice","Moon",1600),
(6,"Dnipro","Sun St 3","Shop E",15,105,"Mark","River",1300),
(7,"Kyiv","Main St 1","Shop A",16,101,"Tom","King",1100),
(8,"Odesa","Blue St 7","Shop C",17,103,"Sara","Queen",1400),
(9,"Lviv","Green St 5","Shop B",18,102,"Luke","Sky",1700),
(10,"Kyiv","Main St 1","Shop A",19,101,"Ella","East",1000),
(11,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200),
(12,"Lviv","Green St 5","Shop B",12,102,"Anna","Wind",1500),
(13,"Odesa","Blue St 7","Shop C",13,103,"Bob","Stone",900),
(14,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200),
(15,"Kharkiv","Red St 9","Shop D",14,104,"Alice","Moon",1600),
(16,"Dnipro","Sun St 3","Shop E",15,105,"Mark","River",1300),
(17,"Kyiv","Main St 1","Shop A",16,101,"Tom","King",1100),
(18,"Odesa","Blue St 7","Shop C",17,103,"Sara","Queen",1400),
(19,"Lviv","Green St 5","Shop B",18,102,"Luke","Sky",1700),
(20,"Kyiv","Main St 1","Shop A",19,101,"Ella","East",1000),
(21,NULL,"Main St 1","Shop A",NULL,101,"John","Snow",1200),
(22,"Lviv",NULL,"Shop B",12,102,NULL,"Wind",1500),
(23,"Odesa","Blue St 7",NULL,13,NULL,"Bob","Stone",900),
(24,"Kyiv","Main St 1","Shop A",NULL,101,"John","Snow",1200),
(25,"Kharkiv","Red St 9",NULL,14,104,"Alice","Moon",NULL),
(26,NULL,"Sun St 3","Shop E",15,NULL,"Mark","River",1300),
(27,"Kyiv",NULL,"Shop A",16,101,NULL,"King",1100),
(28,NULL,"Blue St 7","Shop C",17,NULL,"Sara","Queen",NULL),
(29,"Lviv",NULL,"Shop B",18,102,"Luke",NULL,1700),
(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

CREATE OR REPLACE TABLE `HW3.raw_data_customer` AS
SELECT
 *,
 GENERATE_UUID() AS order_id
FROM `HW3.raw_data_customer`;

CREATE OR REPLACE TABLE `HW3.raw_data_book` AS
SELECT
 *,
 GENERATE_UUID() AS order_id
FROM `HW3.raw_data_book`;

CREATE OR REPLACE TABLE `HW3.raw_data_payment_date` AS
SELECT
 *,
 GENERATE_UUID() AS order_id
FROM `HW3.raw_data_payment_date`;

CREATE OR REPLACE TABLE `HW3.raw_data_from_shop` AS
SELECT
 *,
 GENERATE_UUID() AS order_id
FROM `HW3.raw_data_from_shop`;


-- STAGE LAYER (replacing NULL with '-')

CREATE OR REPLACE TABLE `HW3.stg_data_customer` AS
SELECT DISTINCT
 order_id,
 customer_id,
 COALESCE(first_name, '-') AS customer_first_name,
 COALESCE(last_name, '-') AS customer_last_name,
 COALESCE(phone_number, '-') AS customer_phone_number,
 COALESCE(customer_email, '-') AS customer_email
FROM `HW3.raw_data_customer`;

CREATE OR REPLACE TABLE `HW3.stg_data_book` AS
SELECT DISTINCT
 order_id,
 book_id,
 COALESCE(name, '-') AS book_name,
 COALESCE(author, '-') AS book_author,
 COALESCE(CAST(pages_amount AS STRING), '-') AS pages_amount,
 COALESCE(category, '-') AS book_category,
 COALESCE(CAST(publication_year AS STRING), '-') AS publication_year,
 COALESCE(language, '-') AS book_language,
 COALESCE(publisher, '-') AS book_publisher
FROM `HW3.raw_data_book`;

CREATE OR REPLACE TABLE `HW3.stg_data_payment_date` AS
SELECT DISTINCT
 order_id,
 payment_id,
 COALESCE(payment_method, '-') AS payment_method,
 COALESCE(CAST(payment_provided AS STRING), '-') AS payment_provided,
 COALESCE(CAST(date_id AS STRING), '-') AS date_id,
 COALESCE(CAST(date AS STRING), '-') AS payment_date,
 COALESCE(month, '-') AS payment_month,
 COALESCE(year, '-') AS payment_year
FROM `HW3.raw_data_payment_date`;

CREATE OR REPLACE TABLE `HW3.stg_data_from_shop` AS
SELECT DISTINCT
 order_id,
 shop_id,
 COALESCE(city, '-') AS shop_city,
 COALESCE(adress, '-') AS shop_adress,
 COALESCE(name, '-') AS shop_name,
 COALESCE(CAST(seller_id AS STRING), '-') AS seller_id,
 COALESCE(CAST(store_id AS STRING), '-') AS store_id,
 COALESCE(first_name, '-') AS seller_first_name,
 COALESCE(last_name, '-') AS seller_last_name,
 COALESCE(CAST(salary AS STRING), '-') AS seller_salary
FROM `HW3.raw_data_from_shop`;

-- MART LAYER (creating dimensions and facts)

CREATE OR REPLACE TABLE `HW3.dim_customer` AS
SELECT
order_id,
customer_id,
customer_first_name,
customer_last_name,
customer_phone_number,
customer_email
FROM `HW3.stg_data_customer`;

CREATE OR REPLACE TABLE `HW3.dim_book` AS
SELECT
 order_id,
 book_id,
 book_name,
 book_author,
 pages_amount,
 book_category,
 publication_year,
 book_language,
 book_publisher
FROM `HW3.stg_data_book`;

CREATE OR REPLACE TABLE `HW3.dim_payment` AS
SELECT
 order_id,
 payment_id,
 payment_method,
 payment_provided,
 payment_date,
 payment_month,
 payment_year
FROM `HW3.stg_data_payment_date`;

CREATE OR REPLACE TABLE `HW3.dim_shop` AS
SELECT
 order_id,
 shop_id,
 shop_city,
 shop_adress,
 shop_name,
FROM `HW3.stg_data_from_shop`;

CREATE OR REPLACE TABLE `HW3.dim_seller` AS
SELECT
 order_id,
 seller_id,
 store_id,
 seller_first_name,
 seller_last_name,
 seller_salary
FROM `HW3.stg_data_from_shop`;

CREATE OR REPLACE TABLE `HW3.fact_order` AS
SELECT
 c.order_id,
 c.customer_id,
 b.book_id,
 p.payment_id,
 s.shop_id,
 se.seller_id,
FROM `HW3.dim_customer` AS c
JOIN `HW3.dim_book` AS b
 ON c.order_id = b.order_id
JOIN `HW3.dim_payment` AS p
 ON c.order_id = p.order_id
JOIN `HW3.dim_shop` AS s
 ON s.order_id = p.order_id
JOIN `HW3.dim_seller` AS se
 ON s.order_id = se.order_id;

-- FINAL SELECT (the biggest salary of seller)

SELECT
 s.shop_name,
 CONCAT(se.seller_first_name, ' ', se.seller_last_name) AS seller_name,
 se.seller_salary
FROM `HW3.dim_seller` AS se
JOIN `HW3.dim_shop` AS s
 ON s.order_id = se.order_id
ORDER BY seller_salary DESC
LIMIT 1;






















