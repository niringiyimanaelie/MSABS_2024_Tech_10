CREATE TABLE Question_5_p2 AS
SELECT 
    verified_purchase,
    AVG(star_rating) AS avg_rating
FROM reviews_clean
GROUP BY verified_purchase;

CREATE TABLE Question_5_p1 AS
SELECT AVG(star_rating) AS avg_rating
FROM reviews_clean;



CREATE TABLE Question_6 AS
SELECT star_rating FROM reviews_clean;


CREATE TABLE Question_9 AS
SELECT 
    EXTRACT(YEAR FROM review_date) AS review_year,
    COUNT(*) AS review_count
FROM reviews_clean
WHERE helpful_votes >= 1
GROUP BY review_year
ORDER BY review_year;

SELECT 
    CONCAT(EXTRACT(YEAR FROM review_date), '-', LPAD(EXTRACT(MONTH FROM review_date), 2, '0')) AS review_month_year,
    COUNT(*) AS review_count
FROM reviews_clean
GROUP BY review_month_year
ORDER BY review_month_year;

CREATE TABLE Question_8 AS
SELECT 
    YEAR(review_date) AS review_year,
    MONTH(review_date) AS review_month,
    COUNT(*) AS number_of_reviews
FROM 
    reviews_clean
GROUP BY 
    YEAR(review_date),
    MONTH(review_date)
ORDER BY 
    review_year,
    review_month;

CREATE TABLE Question_10 AS
WITH YearlyTotals AS (
    SELECT 
        YEAR(review_date) AS review_year,
        SUM(CASE WHEN helpful_votes > 0 THEN 1 ELSE 0 END) AS ax,  -- Count of helpful reviews for the year
        COUNT(*) AS bx  -- Total number of reviews for the year
    FROM 
        reviews_clean
    GROUP BY 
        YEAR(review_date)
)

SELECT 
    yt.review_year,
    yt.ax / yt.bx AS index_value
FROM 
    YearlyTotals yt
ORDER BY 
    yt.review_year;


CREATE TABLE Question_11_p1 AS
SELECT 
    vine,
    COUNT(*) AS total_reviews,
    SUM(CASE WHEN helpful_votes > 0 THEN 1 ELSE 0 END) AS helpful_reviews,
    SUM(CASE WHEN helpful_votes > 0 THEN 1 ELSE 0 END) * 1.0 / COUNT(*) AS proportion_helpful
FROM 
    reviews_clean
GROUP BY 
    vine;



