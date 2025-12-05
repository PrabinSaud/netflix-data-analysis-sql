/* ============================================================
   TOPIC: SQL CASE FUNCTION PRACTICE QUESTIONS
   DESCRIPTION: This section contains 20 real-world SQL problems 
   designed to help learners master conditional logic using the 
   CASE expression with products, customers, and orders data.
   ============================================================ */


use ola;
SELECT * FROM products;

-- Count how many timess each customer has made an order with saless greater than 50.
SELECT 
    p.product_id,
    p.product_name,
    p.category,
    p.price,
    SUM(CASE 
		WHEN p.price > 50 THEN 1 
		ELSE 0 
    END) AS PriceAbove30,
    COUNT(*) AS TotalProducts
FROM products AS p
GROUP BY p.product_id, p.product_name, p.category
ORDER BY p.product_id;


/* 3. Label products based on price:
      >100 → 'Premium'
      51–100 → 'Standard'
      <=50 → 'Budget'. */
      
SELECT 
* ,
CASE
	WHEN price > 100 THEN 'Premium'
    WHEN price between 51 and 100 THEN 'Standard'
    Else 'Budget'
END as Lable
From products;
	

/* 4. For each order, show:
      quantity >= 50 → 'Bulk Order'
      20–40 → 'Medium Order'
      10 → 'Low Order'. */
ALTER TABLE products
ADD quantity INT;
UPDATE products SET quantity = 50  WHERE product_id = 101;
UPDATE products SET quantity = 35  WHERE product_id = 102;
UPDATE products SET quantity = 60  WHERE product_id = 103;
UPDATE products SET quantity = 25  WHERE product_id = 104;
UPDATE products SET quantity = 40  WHERE product_id = 105;
UPDATE products SET quantity = 80  WHERE product_id = 106;
UPDATE products SET quantity = 30  WHERE product_id = 107;
UPDATE products SET quantity = 90  WHERE product_id = 108;
UPDATE products SET quantity = 20  WHERE product_id = 109;
UPDATE products SET quantity = 55  WHERE product_id = 110;

SELECT *,
CASE 
	WHEN quantity >=50 THEN 'Bulk Order'
    WHEN quantity BETWEEN 30 AND 40 THEN 'Medium Order'
	WHEN quantity > 10 THEN 'Low Order'
    ELSE 'No Order'
END as OrderLabel
FROM products;




/* 5. Show price status of products:
      Highest price → 'Most Expensive'
      Lowest price → 'Cheapest'
      Else → 'Normal Price'. */
      
SELECT 
* ,
CASE 
	WHEN price = (SELECT MAX(price) FROM products) THEN 'Most Expensive'
    WHEN price = (SELECT MIN(price)FROM products )THEN 'Chepest'
    ELSE 'Normal Price'
END as pricetag
FROM products
ORDER BY price DESC;

/* 6. For each customer, show:
      total orders = 0 → 'No Orders'
      1–3 orders → 'New Customer'
      >3 orders → 'Regular Customer'. */

/* 7. Show stock status (assume field stock_qty exists):
      stock >= 50 → 'High Stock'
      20–49 → 'Moderate Stock'
      < 20 → 'Low Stock'. */

/* 8. Label orders based on revenue (quantity * price):
      >200 → 'High Value'
      50–200 → 'Medium Value'
      <50 → 'Low Value'. */

/* 9. Tag products based on category:
      Dairy, Bakery → 'Food'
      Household → 'Home Product'
      Others → 'Misc'. */

/* 10. Mark orders as:
       ordered on weekend → 'Weekend Sale'
       ordered on weekday → 'Weekday Sale'. */

/* 11. Classify product names:
       containing 'Pack' → 'Pack Item'
       containing 'Bottle' → 'Beverage'
       else → 'General'. */

/* 12. For each price, label:
       divisible by 5 → 'Rounded Price'
       else → 'Odd Price'. */

/* 13. For each customer:
       name starting with A–M → 'Group 1'
       name N–Z → 'Group 2'. */

/* 14. Identify best seller:
       highest total quantity sold → 'Top Product'
       else → 'Normal Product'. */

/* 15. Classify categories by average price:
       avg price > 70 → 'High Cost Category'
       40–70 → 'Medium Cost Category'
       < 40 → 'Low Cost Category'. */

/* 16. For each order:
       if product is Grocery → add label 'Daily Use'
       if product is Snack → 'Snack Item'
       else → 'Other Item'. */

/* 17. Mark quantity as:
       even → 'Even Quantity'
       odd → 'Odd Quantity'. */

/* 18. Label products by name length:
       length > 12 → 'Long Name'
       6–12 → 'Medium Name'
       < 6 → 'Short Name'. */

/* 19. Flag expensive categories:
       household & snack categories avg price > 50 → 'Expensive Category'
       else → 'Normal Category'. */

/* 20. For each order, show:
       if no matching product → 'Invalid Product'
       else → 'Valid Product'. */

