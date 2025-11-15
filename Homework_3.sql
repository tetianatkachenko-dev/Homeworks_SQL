-- RAW LAYER

create schema HW3_Undir_Tkachenko;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.raw_data_customer` (
 customer_id INT64,
 first_name STRING,
 last_name STRING,
 phone_number STRING,
 customer_email STRING,
 order_id INT64
);

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.raw_data_book` (
 book_id INT64,
 name STRING,
 author STRING,
 pages_amount INT64,
 category STRING,
 publication_year INT64,
 language STRING,
 publisher STRING,
 price INT64,
 order_id INT64
);

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.raw_data_payment_date` (
 payment_id INT64,
 payment_method STRING, 
 payment_provided BOOL,
 date_id INT64,
 date DATE,
 month STRING,
 year STRING,
 order_id INT64
);

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.raw_data_from_shop` (
 shop_id INT64,
 city STRING,
 adress STRING,
 name STRING,
 seller_id INT64,
 store_id INT64,
 first_name STRING,
 last_name STRING,
 salary INT64,
 order_id INT64
);

INSERT INTO `HW3_Undir_Tkachenko.raw_data_customer` VALUES
(1,"Anna","Brown","123456789","anna@example.com",17),
(2,"John","Smith","987654321","john.smith@example.com",3),
(3,"Maria","Garcia","555777888","maria@example.com",25),
(4,"Alex","Johnson","444555666","alex@example.com",0),
(5,"Kate","Martinez","222333444","kate@example.com",12),
(6,"Tom","Williams","123123123","tom@example.com",29),
(7,"Emily","Davis","555666777","emily@example.com",8),
(8,"David","Miller","777888999","david@example.com",21),
(9,"Sarah","Wilson","111222333","sarah@example.com",14),
(10,"Chris","Moore","444111222","chris@example.com",30),
(11,"Anna","Brown","123456789","anna@example.com",5),
(12,"John","Smith","987654321","john.smith@example.com",19),
(13,"Maria","Garcia","555777888","maria@example.com",1),
(14,"Alex","Johnson","444555666","alex@example.com",27),
(15,"Kate","Martinez","222333444","kate@example.com",6),
(16,"Tom","Williams","123123123","tom@example.com",24),
(17,"Emily","Davis","555666777","emily@example.com",10),
(18,"David","Miller","777888999","david@example.com",2),
(19,"Sarah","Wilson","111222333","sarah@example.com",23),
(20,"Chris","Moore","444111222","chris@example.com",15),
(21,NULL,"Brown","123456789",NULL,9),
(22,"John",NULL,"987654321","john.smith@example.com",28),
(23,NULL,"Garcia","555777888","maria@example.com",4),
(24,"Alex","Johnson",NULL,"alex@example.com",22),
(25,"Kate","Martinez","222333444",NULL,11),
(26,"Tom","Williams","123123123","tom@example.com",20),
(27,NULL,"Davis","555666777","emily@example.com",13),
(28,"David","Miller","777888999",NULL,7),
(29,"Sarah","Wilson",NULL,"sarah@example.com",26),
(30,NULL,"Moore","444111222","chris@example.com",18);

INSERT INTO `HW3_Undir_Tkachenko.raw_data_book` VALUES
(1,"1984","George Orwell",120,"Drama",1999,"English","Pub1",150,30),
(2,"Dune","Frank Herbert",350,"SciFi",2001,"English","Pub2",220,28),
(3,"The Hobbit","J.R.R. Tolkien",200,"Fantasy",2010,"German","Pub3",180,26),
(4,"One Hundred Years of Solitude","Gabriel García Márquez",450,"Drama",2005,"Spanish","Pub4",260,29),
(5,"Harry Potter and the Philosopher's Stone","J.K. Rowling",300,"Fantasy",2015,"English","Pub5",200,27),
(6,"The Witcher: Blood of Elves","Andrzej Sapkowski",180,"Drama",2008,"Polish","Pub6",140,25),
(7,"Foundation","Isaac Asimov",500,"SciFi",2020,"English","Pub7",300,23),
(8,"Shadows of Forgotten Ancestors","Mykhailo Kotsiubynsky",250,"Drama",2004,"Ukrainian","Pub8",170,21),
(9,"The Chronicles of Narnia","C.S. Lewis",390,"Fantasy",2011,"English","Pub9",240,19),
(10,"The Little Prince","Antoine de Saint-Exupéry",220,"Drama",2009,"French","Pub10",160,24),
(11,"1984","George Orwell",120,"Drama",1999,"English","Pub1",150,22),
(12,"Dune","Frank Herbert",350,"SciFi",2001,"English","Pub2",220,20),
(13,"The Hobbit","J.R.R. Tolkien",200,"Fantasy",2010,"German","Pub3",180,18),
(14,"One Hundred Years of Solitude","Gabriel García Márquez",450,"Drama",2005,"Spanish","Pub4",260,17),
(15,"Harry Potter and the Philosopher's Stone","J.K. Rowling",300,"Fantasy",2015,"English","Pub5",200,15),
(16,"The Witcher: Blood of Elves","Andrzej Sapkowski",180,"Drama",2008,"Polish","Pub6",140,13),
(17,"Foundation","Isaac Asimov",500,"SciFi",2020,"English","Pub7",300,11),
(18,"Shadows of Forgotten Ancestors","Mykhailo Kotsiubynsky",250,"Drama",2004,"Ukrainian","Pub8",170,16),
(19,"The Chronicles of Narnia","C.S. Lewis",390,"Fantasy",2011,"English","Pub9",240,14),
(20,"The Little Prince","Antoine de Saint-Exupéry",220,"Drama",2009,"French","Pub10",160,12),
(21,NULL,"George Orwell",120,"Drama",1999,"English","Pub1",150,10),
(22,"Dune",NULL,350,"SciFi",2001,"English","Pub2",220,9),
(23,"The Hobbit","J.R.R. Tolkien",NULL,"Fantasy",2010,"German","Pub3",180,8),
(24,"One Hundred Years of Solitude","Gabriel García Márquez",450,NULL,2005,"Spanish","Pub4",260,7),
(25,"Harry Potter and the Philosopher's Stone","J.K. Rowling",300,"Fantasy",NULL,"English","Pub5",200,6),
(26,"The Witcher: Blood of Elves","Andrzej Sapkowski",180,"Drama",2008,NULL,"Pub6",140,5),
(27,"Foundation",NULL,500,"SciFi",2020,"English","Pub7",300,4),
(28,"Shadows of Forgotten Ancestors","Mykhailo Kotsiubynsky",250,"Drama",2004,"Ukrainian",NULL,170,3),
(29,"The Chronicles of Narnia","C.S. Lewis",390,"Fantasy",2011,NULL,"Pub9",240,2),
(30,NULL,"Antoine de Saint-Exupéry",220,"Drama",2009,"French","Pub10",160,1);

INSERT INTO `HW3_Undir_Tkachenko.raw_data_payment_date` VALUES
(1,"card",TRUE,1,"2021-01-01","Jan","2021",17),
(2,"cash",FALSE,2,"2021-02-02","Feb","2021",3),
(3,"card",TRUE,3,"2021-03-03","Mar","2021",25),
(4,"cash",TRUE,4,"2021-04-04","Apr","2021",0),
(5,"card",FALSE,5,"2021-05-05","May","2021",12),
(6,"cash",TRUE,6,"2021-06-06","Jun","2021",29),
(7,"card",TRUE,7,"2021-07-07","Jul","2021",8),
(8,"cash",FALSE,8,"2021-08-08","Aug","2021",21),
(9,"card",TRUE,9,"2021-09-09","Sep","2021",14),
(10,"cash",TRUE,10,"2021-10-10","Oct","2021",30),
(11,"card",TRUE,1,"2021-01-01","Jan","2021",5),
(12,"cash",FALSE,2,"2021-02-02","Feb","2021",19),
(13,"card",TRUE,3,"2021-03-03","Mar","2021",1),
(14,"cash",TRUE,4,"2021-04-04","Apr","2021",27),
(15,"card",FALSE,5,"2021-05-05","May","2021",6),
(16,"cash",TRUE,6,"2021-06-06","Jun","2021",24),
(17,"card",TRUE,7,"2021-07-07","Jul","2021",10),
(18,"cash",FALSE,8,"2021-08-08","Aug","2021",2),
(19,"card",TRUE,9,"2021-09-09","Sep","2021",23),
(20,"cash",TRUE,10,"2021-10-10","Oct","2021",15),
(21,NULL,TRUE,11,NULL,"Jan","2021",9),
(22,"cash",NULL,12,"2021-02-02","Feb",NULL,28),
(23,NULL,TRUE,13,"2021-03-03","Mar","2021",4),
(24,"cash",TRUE,NULL,"2021-04-04","Apr","2021",22),
(25,"card",NULL,15,"2021-05-05",NULL,"2021",11),
(26,"cash",TRUE,16,"2021-06-06","Jun",NULL,20),
(27,"card",TRUE,17,NULL,"Jul","2021",13),
(28,NULL,FALSE,18,"2021-08-08","Aug","2021",7),
(29,"card",TRUE,NULL,"2021-09-09","Sep","2021",26),
(30,NULL,NULL,20,"2021-10-10","Oct","2021",18);

INSERT INTO `HW3_Undir_Tkachenko.raw_data_from_shop` VALUES
(1,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200,17),
(2,"Lviv","Green St 5","Shop B",12,102,"Anna","Wind",1500,3),
(3,"Odesa","Blue St 7","Shop C",13,103,"Bob","Stone",900,25),
(4,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200,0),
(5,"Kharkiv","Red St 9","Shop D",14,104,"Alice","Moon",1600,12),
(6,"Dnipro","Sun St 3","Shop E",15,105,"Mark","River",1300,29),
(7,"Kyiv","Main St 1","Shop A",16,101,"Tom","King",1100,8),
(8,"Odesa","Blue St 7","Shop C",17,103,"Sara","Queen",1400,21),
(9,"Lviv","Green St 5","Shop B",18,102,"Luke","Sky",1700,14),
(10,"Kyiv","Main St 1","Shop A",19,101,"Ella","East",1000,30),
(11,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200,5),
(12,"Lviv","Green St 5","Shop B",12,102,"Anna","Wind",1500,19),
(13,"Odesa","Blue St 7","Shop C",13,103,"Bob","Stone",900,1),
(14,"Kyiv","Main St 1","Shop A",11,101,"John","Snow",1200,27),
(15,"Kharkiv","Red St 9","Shop D",14,104,"Alice","Moon",1600,6),
(16,"Dnipro","Sun St 3","Shop E",15,105,"Mark","River",1300,24),
(17,"Kyiv","Main St 1","Shop A",16,101,"Tom","King",1100,10),
(18,"Odesa","Blue St 7","Shop C",17,103,"Sara","Queen",1400,2),
(19,"Lviv","Green St 5","Shop B",18,102,"Luke","Sky",1700,23),
(20,"Kyiv","Main St 1","Shop A",19,101,"Ella","East",1000,15),
(21,NULL,"Main St 1","Shop A",NULL,101,"John","Snow",1200,9),
(22,"Lviv",NULL,"Shop B",12,102,NULL,"Wind",1500,28),
(23,"Odesa","Blue St 7",NULL,13,NULL,"Bob","Stone",900,4),
(24,"Kyiv","Main St 1","Shop A",NULL,101,"John","Snow",1200,22),
(25,"Kharkiv","Red St 9",NULL,14,104,"Alice","Moon",NULL,11),
(26,NULL,"Sun St 3","Shop E",15,NULL,"Mark","River",1300,20),
(27,"Kyiv",NULL,"Shop A",16,101,NULL,"King",1100,13),
(28,NULL,"Blue St 7","Shop C",17,NULL,"Sara","Queen",NULL,7),
(29,"Lviv",NULL,"Shop B",18,102,"Luke",NULL,1700,26),
(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18);

-- STAGE LAYER (replacing NULL with '-')

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.stg_data_customer` AS
SELECT 
 order_id,
 customer_id,
 COALESCE(first_name, '-') AS customer_first_name,
 COALESCE(last_name, '-') AS customer_last_name,
 COALESCE(phone_number, '-') AS customer_phone_number,
 COALESCE(customer_email, '-') AS customer_email
FROM ( SELECT *,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY customer_id) AS rn
  FROM `HW3_Undir_Tkachenko.raw_data_customer`
)
WHERE rn = 1;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.stg_data_book` AS
SELECT 
 order_id,
 book_id,
 COALESCE(name, '-') AS book_name,
 COALESCE(author, '-') AS book_author,
 COALESCE(CAST(pages_amount AS STRING), '-') AS pages_amount,
 COALESCE(category, '-') AS book_category,
 COALESCE(CAST(publication_year AS STRING), '-') AS publication_year,
 COALESCE(language, '-') AS book_language,
 COALESCE(publisher, '-') AS book_publisher,
 price AS book_price
FROM ( SELECT *,
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY book_id) AS rn
  FROM `HW3_Undir_Tkachenko.raw_data_book`
)
WHERE rn = 1;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.stg_data_payment_date` AS
SELECT 
 order_id,
 payment_id,
 date AS payment_date,
 COALESCE(payment_method, '-') AS payment_method,
 COALESCE(CAST(payment_provided AS STRING), '-') AS payment_provided,
 COALESCE(CAST(date_id AS STRING), '-') AS date_id,
 COALESCE(month, '-') AS payment_month,
 COALESCE(year, '-') AS payment_year
FROM ( SELECT *,
    ROW_NUMBER() OVER (PARTITION BY payment_id ORDER BY payment_id) AS rn
  FROM `HW3_Undir_Tkachenko.raw_data_payment_date`
)
WHERE rn = 1;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.stg_data_from_shop` AS
SELECT 
 order_id,
 shop_id,
 seller_id,
 store_id,
 COALESCE(city, '-') AS shop_city,
 COALESCE(adress, '-') AS shop_adress,
 COALESCE(name, '-') AS shop_name,
 COALESCE(first_name, '-') AS seller_first_name,
 COALESCE(last_name, '-') AS seller_last_name,
 COALESCE(CAST(salary AS STRING), '-') AS seller_salary
FROM ( SELECT *,
    ROW_NUMBER() OVER (PARTITION BY name ORDER BY shop_id) AS rn
  FROM `HW3_Undir_Tkachenko.raw_data_from_shop`
)
WHERE rn = 1;

-- MART LAYER (creating dimensions and facts)

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.dim_customer` AS
SELECT
order_id,
customer_id,
customer_first_name,
customer_last_name,
customer_phone_number,
customer_email
FROM `HW3_Undir_Tkachenko.stg_data_customer`;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.dim_book` AS
SELECT
 order_id,
 book_id,
 book_name,
 book_author,
 pages_amount,
 book_category,
 publication_year,
 book_language,
 book_publisher,
 book_price
FROM `HW3_Undir_Tkachenko.stg_data_book`;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.dim_payment` AS
SELECT
 order_id,
 payment_id,
 payment_method,
 payment_provided,
 payment_date,
 payment_month,
 payment_year
FROM `HW3_Undir_Tkachenko.stg_data_payment_date`;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.dim_shop` AS
SELECT
 order_id,
 shop_id,
 shop_city,
 shop_adress,
 shop_name,
FROM `HW3_Undir_Tkachenko.stg_data_from_shop`;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.dim_seller` AS
SELECT
 order_id,
 seller_id,
 store_id,
 seller_first_name,
 seller_last_name,
 seller_salary
FROM `HW3_Undir_Tkachenko.stg_data_from_shop`;

CREATE OR REPLACE TABLE `HW3_Undir_Tkachenko.fact_order` AS
SELECT
 c.order_id,
 c.customer_id,
 b.book_id,
 p.payment_id,
 s.shop_id,
 se.seller_id,
FROM `HW3_Undir_Tkachenko.dim_customer` AS c
JOIN `HW3_Undir_Tkachenko.dim_book` AS b
 ON c.order_id = b.order_id
JOIN `HW3_Undir_Tkachenko.dim_payment` AS p
 ON c.order_id = p.order_id
JOIN `HW3_Undir_Tkachenko.dim_shop` AS s
 ON s.order_id = p.order_id
JOIN `HW3_Undir_Tkachenko.dim_seller` AS se
 ON s.order_id = se.order_id;

-- FINAL SELECT (the biggest salary of seller)

SELECT
 b.book_name,
 b.book_price,
 CONCAT(se.seller_first_name, ' ', se.seller_last_name) AS seller_name,
 se.seller_salary
FROM `HW3_Undir_Tkachenko.fact_order` AS f
JOIN `HW3_Undir_Tkachenko.dim_seller` AS se
 ON f.seller_id = se.seller_id
JOIN `HW3_Undir_Tkachenko.dim_book` AS b
 ON f.book_id = b.book_id
ORDER BY b.book_price DESC
LIMIT 1;





















