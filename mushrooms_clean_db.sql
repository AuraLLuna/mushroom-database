--*** Mushroom SQL - clean Data csv file - SQL query ***--
CREATE TABLE IF NOT EXISTS mushrooms (
        class_ VARCHAR(1),
        cap_shape VARCHAR(1),
        cap_surface VARCHAR(1),
        cap_color VARCHAR(1),
        bruises BOOLEAN,
        odor VARCHAR(1),
        gill_attachment VARCHAR(1),
        gill_spacing VARCHAR(1),
        gill_size VARCHAR(1),
        gill_color VARCHAR(1),
        stalk_shape VARCHAR(1),
        stalk_root VARCHAR(1),
        stalk_surface_above_ring VARCHAR(1),
        stalk_surface_below_ring VARCHAR(1),
        stalk_color_above_ring VARCHAR(1),
        stalk_color_below_ring VARCHAR(1),
        veil_type VARCHAR(1),
        veil_color VARCHAR(1),
		ring_number INTEGER,
        ring_type VARCHAR(1),
        spore_print_color VARCHAR(1),
        pop VARCHAR(1),
        habitat VARCHAR(1)
);
--* 15 SQL Queries created by CHAT GPT *--

-- What is the total number of mushrooms in the dataset?
SELECT COUNT(*) FROM mushrooms;

-- What are the distinct cap colors present in the dataset?
SELECT DISTINCT cap_color FROM mushrooms;

-- How many mushrooms have an almond odor?
SELECT COUNT(*) as almond_odor FROM mushrooms 
WHERE odor ='a';

-- How many mushrooms are classified as poisonous?
SELECT COUNT(*) FROM mushrooms 
WHERE class_ = 'p';

-- What is the most common gill color?
SELECT gill_color, 
	COUNT(*) AS color_count FROM mushrooms 
	GROUP BY gill_color 
	ORDER BY color_count DESC
	LIMIT 1;


-- Which cap shapes appear on edible mushrooms?
SELECT DISTINCT cap_shape
	FROM mushrooms
	WHERE class_ = 'e';
	
-- How many mushrooms are there for each type of odor?
SELECT COUNT (*) AS odor_count FROM mushrooms
	GROUP by odor;

-- What percentage of mushrooms have a smooth cap surface?
SELECT ROUND(
	(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM mushrooms)) ,2) 
	AS smooth_cap_perc 
	FROM mushrooms
	WHERE cap_surface = 's';

-- What are the habitat types and the total number of mushrooms found in each?
SELECT habitat,
	COUNT(*) AS mushroom_count_from_habitat FROM mushrooms
	GROUP BY habitat;

--What is the most frequent combination of cap color and odor?
SELECT cap_color, odor FROM mushrooms
	GROUP BY cap_color, odor
	ORDER BY COUNT(*) DESC
	LIMIT 1;


-- Which poisonous mushrooms have smooth caps and are found in urban habitats?
SELECT * FROM mushrooms
	WHERE class_ = 'p'
	AND cap_surface = 's'
	AND habitat = 'u';

-- Compare the average ring number between edible and poisonous mushrooms.
SELECT class_, ring_number, 
	COUNT(*) AS count_ FROM mushrooms
	GROUP by class_, ring_number
	ORDER BY class_;
	

-- What is the most frequent cap surface for poisonous mushrooms in each habitat type?
SELECT habitat, cap_surface, 
	COUNT(*) AS count_ FROM mushrooms
	WHERE class_ = 'p'
	GROUP BY habitat, cap_surface
	ORDER BY habitat, count_ DESC;
	
-- Which combination of features (e.g., cap shape, odor, and gill color) best predicts poisonous mushrooms?
WITH max_combo AS (
	SELECT MAX(count_) AS max_combo FROM (
		SELECT COUNT(*) AS count_ FROM mushrooms
		WHERE class_ = 'p'
		GROUP BY cap_shape, odor, gill_color
	) subq
)
SELECT cap_shape, odor, gill_color,
	COUNT(*) AS count_ FROM mushrooms
	WHERE class_ = 'p'
	GROUP BY cap_shape, odor, gill_color
	HAVING COUNT(*) = (SELECT max_combo FROM max_combo);

-- What are the most common features of edible mushrooms, considering cap color, cap shape, and odor?
WITH common_cap_color AS (
	SELECT 'cap_color' as feature_type, cap_color AS feature_value,
		COUNT(*) AS count_ FROM mushrooms 
		WHERE class_ = 'e'
		GROUP by cap_color
		ORDER BY count_ DESC
		LIMIT 1
),
common_cap_shape AS (
	SELECT 'cap_shape', cap_shape,
		COUNT(*) AS count_ FROM mushrooms
		WHERE class_ = 'e'
		GROUP BY cap_shape
		ORDER BY count_ DESC
		LIMIT 1
),
common_odor AS (
SELECT 'odor', odor,
	COUNT(*) AS count_ FROM mushrooms
	WHERE class_ = 'e'
	GROUP BY odor
	ORDER BY count_ DESC
	LIMIT 1
)
SELECT * FROM common_cap_color
UNION ALL
SELECT * FROM common_cap_shape
UNION ALL
SELECT * FROM common_odor;