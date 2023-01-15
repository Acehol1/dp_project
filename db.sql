CREATE SCHEMA if not exists shop_db;

CREATE TABLE IF NOT EXISTS shop_db.user_status (
 id serial primary key,
 name varchar(50) not null
);

CREATE TABLE IF NOT EXISTS shop_db.user (
  id serial primary key,
  name varchar(50) not null,
  surname varchar(50) not null,
  email varchar(100),
  phone varchar(16),
  user_status_id integer references shop_db.user_status(id) not null default 1,
  CONSTRAINT user_email check(((phone is  null) and (email is not null)) or ((phone is not null) and (email is null)) or ((phone is not null) and (email is not null))),
  CONSTRAINT user_check_phone check((phone similar to '(\+?[7-8]?)(\(?)[0-9]{3}(\)?)[0-9]{3}(\-?)[0-9]{2}(\-?)[0-9]{2}') or (phone=''))
  -- CONSTRAINT user_check_email check((email similar to '^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$') or (email=''))
  );

CREATE TABLE IF NOT EXISTS shop_db.provider (
 id serial primary key ,
 name varchar(50) not null,
 owner_id integer references shop_db.user(id) on delete cascade not null
);

CREATE TABLE IF NOT EXISTS shop_db.categories (
 id serial primary key ,
 name varchar(50) not null
);
CREATE TABLE IF NOT EXISTS shop_db.product (
 id serial primary key,
 name varchar(50) not null,
 description text not null,
 price integer not null check ( price > 0 ),
 count integer check ( count >= 0 ),
 categories_id integer references shop_db.categories(id) not null,
 provider_id integer references shop_db.provider(id) on delete cascade not null
);

CREATE TABLE IF NOT EXISTS shop_db.private_information (
 id_user integer references shop_db.user(id) on delete cascade not null,
 password varchar(16) not null,
 login varchar(16) not null
);

CREATE TABLE IF NOT EXISTS shop_db.product_image (
 id serial primary key,
 product_id integer references shop_db.product(id) on delete cascade not null,
 url varchar(255) not null
);

CREATE TABLE IF NOT EXISTS shop_db.payment (
 id serial primary key,
 id_user integer references shop_db.user(id) on delete cascade not null,
 number_card varchar(30) not null
);

CREATE TABLE IF NOT EXISTS shop_db.order_status(
 id serial primary key,
 name varchar(255) not null
);

CREATE TABLE IF NOT EXISTS shop_db.address_user(
 id serial primary key,
 id_user integer references shop_db.user on delete cascade not null,
 city varchar(50) not null,
 street varchar(50) not null,
 house varchar(50) not null
);

CREATE TABLE IF NOT EXISTS shop_db.order(
 id serial primary key,
 user_id integer references shop_db.user on delete cascade not null,
 address_id integer references shop_db.address_user not null,
 cart_id integer references shop_db.payment not null,
 data_create timestamptz DEFAULT CURRENT_TIMESTAMP(0),
 status_order_id integer references shop_db.order_status default 1
);
CREATE TABLE IF NOT EXISTS shop_db.product_in_order(
 id serial primary key,
 order_id integer references shop_db.order on delete cascade not null,
 product_id integer references shop_db.product on delete cascade not null,
 count integer not null check ( count > 0 ),
 status_product_id integer references shop_db.order_status not null default 2
);

CREATE TABLE IF NOT EXISTS shop_db.history_order(
 order_id integer references shop_db.order on delete cascade not null,
 status_order_id integer references shop_db.order_status not null,
 description varchar(30) not null,
 data_time timestamptz DEFAULT CURRENT_TIMESTAMP(0),
 product_in_order_id integer references shop_db.product_in_order(id)on delete cascade default null
);
----------------------------------1 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.addhistory() RETURNS TRIGGER
AS $$
 BEGIN
     INSERT INTO shop_db.history_order VALUES (NEW.id, NEW.status_order_id, 'Create order ') ;

     RETURN NEW;
 END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER add_history AFTER INSERT ON shop_db.order
FOR EACH ROW EXECUTE PROCEDURE shop_db.addhistory();

--DROP TRIGGER IF EXISTS add_history ON shop_db.order;
----------------------------------2 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.add_status_user() RETURNS TRIGGER
AS $$
 BEGIN
     UPDATE shop_db.user SET user_status_id = 2 WHERE id = NEW.id_user;

     RETURN NEW;
 END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER add_user AFTER INSERT ON shop_db.private_information
FOR EACH ROW EXECUTE PROCEDURE shop_db.add_status_user();

--DROP TRIGGER IF EXISTS add_user ON shop_db.private_information;
----------------------------------3 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.add_status_provider() RETURNS TRIGGER
AS $$
 BEGIN
     IF (SELECT user_status_id FROM shop_db.user WHERE id = NEW.owner_id) = 2 THEN
        UPDATE shop_db.user SET user_status_id = 3 WHERE id = NEW.owner_id;
        RETURN NEW;
     ELSE
         raise notice 'The user is not registered';
         RETURN null;
     end if;
 END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER add_provider BEFORE INSERT ON shop_db.provider
FOR EACH ROW EXECUTE PROCEDURE shop_db.add_status_provider();
--DROP TRIGGER IF EXISTS  add_provider ON shop_db.provider;
----------------------------------4 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.check_status() RETURNS TRIGGER
AS $$
 BEGIN
        IF OLD.status_product_id != 3 and NEW.status_product_id = 3 THEN
             RETURN NEW;
        ELSE
            RETURN NULL;
           end if;
  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER check_status BEFORE UPDATE ON shop_db.product_in_order
FOR EACH ROW EXECUTE PROCEDURE shop_db.check_status();

--DROP TRIGGER IF EXISTS  check_status ON shop_db.product_in_order;
----------------------------------5 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.check_finish() RETURNS TRIGGER
AS $$
 BEGIN
             IF ((select count(*) from shop_db.product_in_order WHERE order_id = NEW.order_id) =
                 (select count(*) from shop_db.product_in_order WHERE order_id = NEW.order_id and status_product_id =3)) THEN
                      INSERT INTO shop_db.history_order (order_id, status_order_id, description,product_in_order_id) VALUES
                      (NEW.order_id, 2, 'The product is completed',NEW.id);
                      INSERT INTO shop_db.history_order (order_id, status_order_id, description,product_in_order_id) VALUES
                      (NEW.order_id, 3, 'The order is completed',NULL);
                      UPDATE shop_db.order SET status_order_id = 3 WHERE id = NEW.order_id;
             ELSE
                 INSERT INTO shop_db.history_order (order_id, status_order_id, description,product_in_order_id) VALUES
                  (NEW.order_id, 2, 'The product is completed',NEW.id);
             end if;
     RETURN NEW;
  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER check_finish AFTER UPDATE ON shop_db.product_in_order
FOR EACH ROW EXECUTE PROCEDURE shop_db.check_finish();
--DROP TRIGGER IF EXISTS  check_finish ON shop_db.product_in_order;
----------------------------------6 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.add_product() RETURNS TRIGGER
AS $$
 BEGIN
        UPDATE shop_db.order SET status_order_id = 2 WHERE id = NEW.order_id;
        INSERT INTO shop_db.history_order (order_id, status_order_id, description, product_in_order_id) VALUES
        (NEW.order_id, 2, 'Add product in order', NEW.id);

     RETURN NEW;
  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER add_product AFTER INSERT ON shop_db.product_in_order
FOR EACH ROW EXECUTE PROCEDURE shop_db.add_product();

--DROP TRIGGER IF EXISTS add_product ON shop_db.product_in_order;
----------------------------------7 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.minus_product() RETURNS TRIGGER
AS $$
 BEGIN
     UPDATE shop_db.product SET count = count - NEW.count WHERE id = NEW.product_id;
     RETURN NEW;

  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER minus_product BEFORE INSERT ON shop_db.product_in_order
FOR EACH ROW EXECUTE PROCEDURE shop_db.minus_product();

--DROP TRIGGER IF EXISTS minus_product ON shop_db.product_in_order;
----------------------------------8 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.check_password() RETURNS TRIGGER
AS $$
 BEGIN
     IF ((SELECT true FROM shop_db.private_information WHERE id_user = NEW.id_user) = true) THEN
         RETURN null;
     ELSE
         RETURN new;
     end if;

  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER check_password BEFORE INSERT ON shop_db.private_information
FOR EACH ROW EXECUTE PROCEDURE shop_db.check_password();
--DROP TRIGGER IF EXISTS check_password ON shop_db.check_password;
----------------------------------9 Trigger+Procedure----------------------------------
CREATE OR REPLACE FUNCTION shop_db.address_cart() RETURNS TRIGGER
AS $$
 BEGIN
     IF ((SELECT EXISTS(SELECT * FROM shop_db.address_user WHERE id_user = NEW.user_id and id = NEW.address_id)) = true) and
        ((SELECT EXISTS(SELECT * FROM shop_db.payment WHERE id_user = NEW.user_id and id = NEW.cart_id)) = true)
         THEN
         RETURN new;
     ELSE
         raise notice 'Wrong number cart or address';
         RETURN null;
     end if;

  END;
 $$ LANGUAGE plpgsql;

CREATE TRIGGER address_cart BEFORE INSERT ON shop_db.order
FOR EACH ROW EXECUTE PROCEDURE shop_db.address_cart();
--DROP TRIGGER IF EXISTS address_cart ON shop_db.order;