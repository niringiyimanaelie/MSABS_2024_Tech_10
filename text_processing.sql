-- Update review_headline column
UPDATE reviews_raw
SET review_headline = 
    -- Remove punctuation and extraneous characters
    REGEXP_REPLACE(review_headline, '[^a-zA-Z0-9\s]', '', 'g')
    -- Remove leading and trailing whitespace
    FROM (SELECT id, TRIM(review_headline) AS review_headline FROM reviews_raw) AS trimmed
WHERE reviews_raw.id = trimmed.id;

-- Update review_body column
UPDATE reviews_raw
SET review_body = 
    -- Remove punctuation and extraneous characters
    REGEXP_REPLACE(review_body, '[^a-zA-Z0-9\s]', '', 'g')
    -- Remove leading and trailing whitespace
    FROM (SELECT id, TRIM(review_body) AS review_body FROM reviews_raw) AS trimmed
WHERE reviews_raw.id = trimmed.id;
