-- Информация о товаре
SELECT product.name, categories.name,shop_db.user.name as provider_name, shop_db.user.surname as provider_surname FROM shop_db.product
INNER JOIN shop_db.categories on shop_db.product.categories_id = categories.id
INNER JOIN shop_db.provider on product.provider_id = provider.id
INNER JOIN shop_db.user on provider.owner_id = shop_db.user.id;
--Информация о пользователе
SELECT us.name, surname, phone, email, city, street, house, number_card, status.name
FROM shop_db.user as us , shop_db.address_user as address, shop_db.payment as cart, shop_db.user_status as status
WHERE us.id = address.id_user and us.id = cart.id_user and status.id = us.user_status_id;
--Стоймость заказов в общем
SELECT ord.id, us.name , surname, sum(product_ord.count * price) as amount  FROM shop_db.order as ord
INNER JOIN shop_db."user" as us on ord.user_id = us.id
INNER JOIN shop_db.product_in_order as product_ord on ord.id = product_ord.order_id
INNER JOIN shop_db.product as product on product_ord.product_id = product.id
GROUP BY ord.id, us.name, surname
order by ord.id;
--Стоймость одной позиции в заказе
SELECT ord.id, us.name , surname, (product_ord.count * price) as amount  FROM shop_db.order as ord
INNER JOIN shop_db."user" as us on ord.user_id = us.id
INNER JOIN shop_db.product_in_order as product_ord on ord.id = product_ord.order_id
INNER JOIN shop_db.product as product on product_ord.product_id = product.id
order by amount;
-- Удаление товара, который менее популярный
WITH count_order as (
    SELECT product.id,name, sum(product_in_order.count) as order_count , product.count FROM shop_db.product_in_order
    inner join shop_db.product on product_in_order.product_id = product.id
    group by product.id, name, product.count
    order by id
)
DELETE  FROM shop_db.product as prod WHERE prod.id in (
SELECT last.id from (SELECT id, order_count*100/(order_count+count) as proc  FROM count_order
order by proc
limit 1) as last)
returning prod.id;
