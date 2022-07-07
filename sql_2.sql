-- #1
SELECT
    customer.first_name,
    customer.last_name,
    address.address,
    address.district
FROM
    address
    JOIN customer ON customer.address_id = address.address_id
WHERE
    district = 'Texas';

-- #2
SELECT
    customer.first_name,
    customer.last_name
FROM
    customer
    JOIN payment ON customer.customer_id = payment.customer_id
WHERE
    amount > 6.99;

-- #3
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            payment
        GROUP BY
            customer_id
        HAVING
            sum(amount) > 175
    );

-- #4
SELECT
    customer.first_name,
    customer.last_name
FROM
    customer
    JOIN address ON customer.address_id = address.address_id
    JOIN city on address.city_id = city.city_id
    JOIN country on city.country_id = country.country_id
WHERE
    country = 'Nepal';

-- #5
SELECT
    staff.first_name,
    staff.last_name,
    sum(amount)
FROM
    staff
    JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY
    staff.first_name,
    staff.last_name
ORDER BY
    sum(amount) DESC
limit
    1;

-- #6
SELECT
    rating,
    count(rating)
FROM
    film
GROUP BY
    rating;

-- #7
SELECT
    first_name,
    last_name
FROM
    customer
WHERE
    customer_id IN (
        SELECT
            customer_id
        FROM
            payment
        WHERE
            amount IN (
                SELECT
                    amount
                FROM
                    payment
                WHERE
                    amount > 6.99
                GROUP BY
                    amount
                HAVING
                    count(amount) = 1
            )
    );

-- #8
SELECT
    count(amount) as free_rentals
FROM
    payment
WHERE
    amount = 0