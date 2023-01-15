
INSERT INTO shop_db.user_status (name) VALUES
('quest'),
('user'),
('provider');

INSERT INTO shop_db.order_status (name) VALUES
('empty'),
('in progress'),
('finish');

INSERT INTO shop_db.categories ( name) VALUES
('product'),('clothes'),('sport'),('books'),('electronics'),
('shoes'),('furniture'),('accessories'),('hygiene'),('children products');

INSERT INTO shop_db.user ( name, surname, phone, email) VALUES
('Arlene','Maldonado', '7(495)495-85-85','ehood@gmail.com'),
('Yolanda','Carlson', '7(495)291-33-47','british@mac.com'),
('Matthew','Cox', '7(495)736-39-24','miami@gmail.com'),
('Ralph','Bush', '7(495)187-49-78','ahuillet@msn.com'),
('Aaron','Cannon', '7(495)632-11-77','hillct@yahoo.com'),
('Gail','Shaw', '7(495)797-03-53','wenzlaff@hotmail.com'),
('Joseph','Thomas', '7(495)994-92-94','gravyface@optonline.net'),
('Charles','Johnson', '7(495)717-68-60','bowmanbs@gmail.com'),
('Gladys','Jordan', '7(495)926-00-44','farber@yahoo.com'),
('Gladys','Townsend', '7(495)926-00-44','rwelty@me.com'),
('Christian','Ramirez', '7(495)146-33-17','forsberg@live.com'),
('Robert','Anderson', '7(495)257-11-87','presoff@outlook.com'),
('Fred','Harmon', '7(495)041-18-68','rhavyn@icloud.com'),
('Andrea','Fox', '7(495)869-78-94','geeber@yahoo.ca'),
('David','Thomas', '7(495)313-72-18','uncled@optonline.net'),
('Wanda','Wolfe', '7(495)667-84-48','skajan@me.com'),
('Melvin','Fernandez', '7(495)906-76-59','cameron@outlook.com'),
('Sarah','Smith', '7(495)292-08-70','jbuchana@verizon.net'),
('Diane','Murray', '7(495)940-25-88','mstrout@verizon.net'),
('Clinton','Hudson', '7(495)450-90-94','pizza@mac.com');

INSERT INTO shop_db.address_user (id_user, city, street, house) VALUES
(1,'Yekaterinburg', 'Chapayeva','32'),
(2,'Omsk', 'Ivana Alekseyeva','96'),
(3,'Novosibirsk', 'Proyezd Dalidovicha','8'),
(4,'Novosibirs', 'Borisa Bogatkova','67'),
(5,'Kazan', 'Nikolaya Yershova','16'),
(6,'Moscow', 'Kropotkinskiy Pereulok','21'),
(7,'Chelyabinsk', 'Kirova','93'),
(8,'Nizhny Novgorod', 'Premudrova','24'),
(9,'Chelyabinsk', 'Prospekt Lenina','59'),
(10,'Novosibirsk', 'Kropotkina','21'),
(11,'St Petersburg', 'Pechatnika Grigor''yeva','99'),
(12,'Yekaterinburg', 'Shchorsa','41'),
(13,'Nizhny Novgorod', 'Prospekt Lenina','10'),
(14,'Yekaterinburg', 'Mamina-Sibiryaka','20'),
(15,'Chelyabinsk', 'Kommuny','35'),
(16,'Yekaterinburg', 'Mamina-Sibiryaka','81'),
(17,'Novosibirsk', 'Borisa Bogatkova','1'),
(18,'Chelyabinsk', 'Kommuny','41'),
(19,'Moscow', 'Prechistenskiy Pereulok','20'),
(20,'Nizhny Novgorod', 'Minskaya','35'),
(1,'Novosibirsk', 'Borisa Bogatkova','54'),
(3,'Omsk', 'Karla Marksa Prospekt','11'),
(5,'St Petersburg', 'Pechatnika Grigor''yeva','87'),
(7,'Novosibirsk', 'Okruzhnaya Ulitsa','86'),
(9,'Moscow', 'Sarinskiy Proyezd','1'),
(11,'St Petersburg', '8-Ya Sovetskaya Ulitsa','11'),
(13,'Chelyabinsk', 'Salyutnaya','50'),
(15,'Omsk', 'Lermontova','27'),
(17,'Kazan', 'Nikolaya Yershova','67'),
(19,'Borisa Bogatkova', 'Novosibirsk','91');

INSERT INTO shop_db.payment (id_user, number_card) VALUES
(1, '5404 3648 8303 9944'),
(2, '5404 3690 0351 0229'),
(3, '5404 3658 5828 5594'),
(4, '5404 3638 3903 3902'),
(5, '5404 3694 5048 6394'),
(6, '5404 3604 4121 6305'),
(7, '5404 3620 5211 6626'),
(8, '5404 3639 4296 2732'),
(9, '5404 3642 8852 2742'),
(10, '5404 3660 6355 1663'),
(11, '5404 3696 0799 7996'),
(12, '5404 3649 0184 7054'),
(13, '5404 3656 1898 7042'),
(14, '5404 3641 2237 6503'),
(15, '5404 3695 8049 0530'),
(16, '5404 3624 9413 9574'),
(17, '5404 3634 0295 3692'),
(18, '5404 3607 7903 1151'),
(19, '5404 3672 2523 2093'),
(20, '5404 3603 8156 5802'),
(1, '5404 3656 6286 3289'),
(2, '5404 3690 0351 0229'),
(4, '5404 3632 7818 2780'),
(6, '5404 3678 4842 1123'),
(8, '5404 3696 1595 4013'),
(10, '5404 3607 1580 7037'),
(12, '5404 3658 4124 1845'),
(14, '5404 3660 6868 8486'),
(16, '5404 3696 0199 1656'),
(18, '5404 3624 6010 3695'),
(20, '5404 3637 6130 0105');

INSERT INTO shop_db.private_information (id_user, password, login) VALUES
(1, 'OjSNBmsA', 'Wiaildam'),
(2, 'hqiCFPBC', 'Kesthinit'),
(3, 'TUpET163', 'Maskirr'),
(4, '5OV20oiV', 'Nialoney'),
(5, 'X2kFhq46', 'Varkeever'),
(6, 'vJ5a7dO7', 'Uererica'),
(7, 'tSiK09H0', 'Alonncr'),
(8, 'S2O1C8Cs', 'Pheaney'),
(9, '8AuX6lD1', 'Wilannys'),
(10, 'U5z5zae4', 'Fando'),
(11, 'zZU34U8k', 'Ocandwne'),
(12, 'CQ89C9NW', 'Chareteva'),
(13, '1Ew1BD1C', 'Jaralelal'),
(14, '95GMALJ5', 'Yallia'),
(15, '5v8JF0RI', 'Edaifffa');

INSERT INTO shop_db.provider ( name, owner_id) VALUES
('Moovel', 1),
('Beyos', 2),
('Ourseed', 3),
('Icycure', 4),
('Nudenail', 5);

INSERT INTO shop_db.product (name, description, price, count, categories_id, provider_id) VALUES
('Chocolate', 'Classic milk chocolate', 55, 1000, 1 ,1),
('Cast-Iron Jacket', 'Long rip-stop nylon Fabric Parka', 25500, 15, 2 ,1),
('Football', 'Amateur soccer ball', 950, 150, 3 ,2),
('Flowers for Algernon', 'Printed book', 500, 200, 4 ,2),
('Batteries', 'Alkaline batteries 2 pcs', 330, 100, 5 ,3),
('Patrol Boots', 'Womens shoes', 1600, 40, 6 ,3),
('Table', 'Computer desk', 3500, 10, 7 ,4),
('MOVEEK Bandana', '100% High quality Cotton.', 170, 650, 8 ,4),
('CLOSEUP everfresh', 'Gel toothpaste', 130, 440, 9 ,5),
('Baby Monitor', 'Digital baby monitor', 3500, 50, 10 ,5);

INSERT INTO shop_db.product_image ( product_id, url) VALUES
(1,'https://cdn1.ozone.ru/s3/multimedia-g/wc1000/6472639012.jpg'),
(1,'https://cdn1.ozone.ru/s3/multimedia-2/wc1000/6472639070.jpg'),
(2,'https://cdn1.ozone.ru/s3/multimedia-j/wc1000/6442460899.jpg'),
(2,'https://cdn1.ozone.ru/s3/multimedia-y/wc1000/6442460986.jpg'),
(3,'https://cdn1.ozone.ru/s3/multimedia-x/wc1000/6099145473.jpg'),
(3,'https://cdn1.ozone.ru/s3/multimedia-o/wc1000/6099145500.jpg'),
(4,'https://cdn1.ozone.ru/s3/multimedia-l/wc1000/6397187697.jpg'),
(4,'https://cdn1.ozone.ru/s3/multimedia-3/wc1000/6397187715.jpg'),
(5,'https://cdn1.ozone.ru/s3/multimedia-5/wc1000/6100509629.jpg'),
(5,'https://cdn1.ozone.ru/s3/multimedia-7/wc1000/6100506931.jpg'),
(6,'https://cdn1.ozone.ru/s3/multimedia-s/wc1000/6446989780.jpg'),
(7,'https://cdn1.ozone.ru/s3/multimedia-m/wc1000/6334895062.jpg'),
(8,'https://cdn1.ozone.ru/s3/multimedia-4/wc1000/6015650248.jpg'),
(9,'https://cdn1.ozone.ru/s3/multimedia-8/wc1000/6416578544.jpg'),
(10,'https://cdn1.ozone.ru/s3/multimedia-1/wc1000/6472537513.jpg');

INSERT INTO shop_db.order (user_id, address_id, cart_id) VALUES
(1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),
(10,10,10),(9,9,9),(8,8,8),(7,7,7),(6,6,6),
(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,15,15),
(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),
(2,2,22),(4,4,23),(6,6,24),(8,8,25),(10,10,26),
(12,12,27),(14,14,28),(16,16,29),(18,18,30),(20,20,31),
(1,21,21),(3,22,3),(5,23,5),(7,24,7),(9,25,9),
(11,26,11),(13,27,13),(15,28,15),(17,29,17),(19,30,19);

INSERT INTO shop_db.product_in_order (order_id, product_id, count) VALUES
(1,1,5),(2,10,3),(3,2,2),(4,9,1),(5,3,1),(6,8,1),(7,4,2),(8,7,1),(9,5,1),(10,6,1),
(11,1,1),(12,2,1),(13,3,1),(14,4,1),(15,5,2),(16,6,4),(17,7,1),(18,8,2),(19,9,2),(20,10,1),
(21,10,1),(22,9,3),(23,8,5),(24,7,1),(25,6,1),(26,5,5),(27,4,4),(28,3,2),(29,2,1),(30,1,20),
(31,1,10),(32,3,1),(33,5,4),(34,7,1),(35,9,4),(36,10,1),(37,8,4),(38,6,1),(39,4,6),(40,2,1),
(1,3,4),(3,2,1),(5,3,2),(7,4,5),(9,5,1),(11,6,1),(13,7,1),(15,8,5),(17,9,2),(19,10,2),
(21,1,23),(23,5,5),(25,10,2),(27,2,1),(29,9,4),(31,3,1),(33,8,1),(35,4,2),(37,7,1),(39,5,4),
(39,9,30),(37,1,400);

