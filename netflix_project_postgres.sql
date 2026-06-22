-- NETFLIX PROJECT USING SQL 
SELECT
	*
FROM
	NETFLIX;

-- 15 Business Problems & Solutions
-- 1. Count the number of Movies vs TV Shows
SELECT
	TYPE,
	COUNT(*)
FROM
	NETFLIX
GROUP BY
	TYPE;

-- 2. Find the most common rating for movies and TV shows
WITH
	RATING_COUNT AS (
		SELECT
			TYPE,
			RATING,
			COUNT(*) AS RATINGS
		FROM
			NETFLIX
		GROUP BY
			TYPE,
			RATING
	),
	RANKED_RATING AS (
		SELECT
			TYPE,
			RATING,
			RATINGS,
			RANK() OVER (
				PARTITION BY
					TYPE
				ORDER BY
					RATINGS DESC
			) AS RANK_
		FROM
			RATING_COUNT
	)
SELECT
	TYPE,
	RATING AS MOST_COMMON_RATING
FROM
	RANKED_RATING
WHERE
	RANK_ = 1;

-- 3. List all movies released in a specific year (e.g., 2020)
SELECT
	TITLE,
	RELEASE_YEAR
FROM
	NETFLIX
WHERE
	RELEASE_YEAR = 2020
	AND 'Movie' IN (TYPE);

-- 4. Identify the longest movie
SELECT
	TYPE,
	DURATION
FROM
	NETFLIX
WHERE
	DURATION = (
		SELECT
			MAX(DURATION)
		FROM
			NETFLIX
	);

-- 5. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT
	*
FROM
	NETFLIX
WHERE
	DIRECTOR LIKE '%Rajiv Chilaka%';

-- 6. List all TV shows with more than 5 seasons
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'TV Show'
	AND DURATION > '5 seasons';


-- 7. List all movies that are documentaries
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND LISTED_IN ILIKE '%Documentaries%';

-- 8. Find all content without a director
SELECT
	*
FROM
	NETFLIX
WHERE
	DIRECTOR IS NULL;

-- 9. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT
	*
FROM
	NETFLIX
WHERE
	CASTS ILIKE '%Salman Khan%'
	AND RELEASE_YEAR > EXTRACT(
		YEAR
		FROM
			CURRENT_DATE) -10;
			

--10. Find the top 5 years with the highest number of content releases
SELECT release_year, COUNT(*) AS total
FROM netflix
GROUP BY release_year
ORDER BY total DESC
LIMIT 5;


--11. How many titles are categorized under "International" content (listed_in contains "International"
SELECT type, COUNT(*) AS international_titles
FROM netflix
WHERE listed_in LIKE '%International%'
GROUP BY type
ORDER BY international_titles DESC;


--12. Find all titles that contain the word "Love" in the titles
SELECT title, type, release_year
FROM netflix
WHERE title LIKE '%Love%'
ORDER BY release_year DESC;

--13. Find the 10 oldest movies or TV Shows.
SELECT title, release_year
FROM netflix
ORDER BY release_year
LIMIT 10;


--14. Which countries produce more TV Shows than Movies?
WITH content_count AS (
    SELECT
        country,
        SUM(CASE WHEN type = 'TV Show' THEN 1 ELSE 0 END) AS tv_shows,
        SUM(CASE WHEN type = 'Movie' THEN 1 ELSE 0 END) AS movies
    FROM netflix
    WHERE country IS NOT NULL
    GROUP BY country
)

SELECT *
FROM content_count
WHERE tv_shows > movies
ORDER BY tv_shows DESC;

--15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field.
--Label content containing these keywords as 'Bad' and all other content as 'Good'. 
--Count how many items fall into each category.

SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY category,type
ORDER BY type;


