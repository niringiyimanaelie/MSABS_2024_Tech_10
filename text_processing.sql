-- Update review_headline column
UPDATE reviews_raw
SET review_headline = 
    TRIM(BOTH ' ' FROM
        REGEXP_REPLACE(review_headline, '[^a-zA-Z0-9\s]', '')
    )
WHERE review_headline IS NOT NULL;

-- Update review_body column
UPDATE reviews_raw
SET review_body = 
    TRIM(BOTH ' ' FROM
        REGEXP_REPLACE(review_body, '[^a-zA-Z0-9\s]', '')
    )
WHERE review_body IS NOT NULL;