
-- shows all customers that rented a car + type of car
SELECT customers.cust_name AS "Name", customers.cust_surname AS "Surname", car_models.model_type AS "Rented Car" 
FROM customers
INNER JOIN cars ON customers.cust_id = cars.fk_cust_id
LEFT JOIN car_models ON cars.fk_model_id = car_models.model_id


-- shows all invoice prices+ date of a specific customer
SELECT customers.cust_name, customers.cust_surname, invoices.invo_price, invoices.invo_date
FROM customers 
LEFT JOIN cars ON customers.cust_id= cars.fk_cust_id
LEFT JOIN invoices ON cars.fk_invo_id= invoices.invo_id
WHERE customers.cust_name = "Heiko"


-- selects all Cars and shows their start/ return locations + date
SELECT
    FirstSet.Car,
    FirstSet.Start_Location,
    FirstSet.Start_Date,
    SecondSet.Return_Location,
    SecondSet.Return_Date
FROM 
(
    SELECT car_models.model_type AS "Car", loc_cities.loc_city_name AS "Start_Location", locations.loc_date AS "Start_Date"
	FROM cars
	LEFT JOIN car_models ON cars.fk_model_id = car_models.model_id
	LEFT JOIN locations ON cars.fk_loc_start_id = locations.loc_id
	LEFT JOIN loc_cities ON locations.fk_loc_city_id = loc_cities.loc_city_id     
) AS FirstSet
INNER JOIN
(
    SELECT car_models.model_type AS "Car", loc_cities.loc_city_name AS "Return_Location", locations.loc_date AS "Return_Date"
	FROM cars
	LEFT JOIN car_models ON cars.fk_model_id = car_models.model_id
	LEFT JOIN locations ON cars.fk_loc_return_id = locations.loc_id
	LEFT JOIN loc_cities ON locations.fk_loc_city_id = loc_cities.loc_city_id
) AS SecondSet
ON FirstSet.Car = SecondSet.Car
ORDER BY FirstSet.Start_Date


-- shows sum of all invoices + sum of all additional charges of a specific customer
SELECT customers.cust_name AS "Customer", SUM(invoices.invo_price) AS "Sum of invoices", SUM(additional_charges.ac_price) AS "Sum of additional charges"
FROM additional_charges
INNER JOIN invoices ON additional_charges.fk_invo_id = invoices.invo_id
INNER JOIN cars ON invoices.invo_id = cars.fk_invo_id
INNER JOIN customers ON cars.fk_cust_id = customers.cust_id
WHERE customers.cust_name = "Marianna"
