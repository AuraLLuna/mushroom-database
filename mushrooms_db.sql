--*** Mushroom SQL database Simple query ***--
CREATE TABLE IF NOT EXISTS mushrooms (
        class_ VARCHAR(1),
        cap_shape VARCHAR(1),
        cap_surface VARCHAR(1),
        cap_color VARCHAR(1),
        bruises VARCHAR(1),
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
		ring_number VARCHAR(1),
        ring_type VARCHAR(1),
        spore_print_color VARCHAR(1),
        pop VARCHAR(1),
        habitat VARCHAR(1)
);

--*** Adjusting the Data Set ***--


-- Removing '?' and replacing with recognizable NULL type
UPDATE mushrooms
SET stalk_root = NULL
WHERE stalk_root = '?';

-- ALtering bruises column from VARCHAR(1) to BOOLEAN type

ALTER TABLE mushrooms 
	ALTER COLUMN bruises TYPE BOOLEAN USING bruises::BOOLEAN;
UPDATE mushrooms
SET bruises = CASE
	WHEN bruises = 't' THEN TRUE
	WHEN bruises = 'f' THEN FALSE
	ELSE NULL
END;

-- ALtering ring_number to actual INT value

UPDATE mushrooms
SET ring_number = CASE
	WHEN ring_number = 'n' THEN 0
	WHEN ring_number = 'o' THEN 1
	WHEN ring_number = 't' THEN 2
	ELSE NULL
END;



ALTER TABLE mushrooms
	ALTER COLUMN ring_number TYPE INTEGER USING ring_number::INTEGER;
	
SELECT * FROM mushrooms
LIMIT 150;

SELECT DISTINCT ring_number FROM mushrooms;



