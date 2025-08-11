-- Create the database
CREATE DATABASE agrihub123;

-- Use the database
USE agrihub123;

-- Create the users table (for signup and login)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create the crop_info table (for storing crop and soil information)
CREATE TABLE crop_info (
    id INT AUTO_INCREMENT PRIMARY KEY,
    crop_name VARCHAR(100) NOT NULL,
    soil_type VARCHAR(100) NOT NULL,
    growing_season VARCHAR(255),
    required_climate VARCHAR(255),
    steps_to_grow TEXT,
    fertilizers_to_use TEXT,
    harvesting_tips TEXT
);

-- Insert sample data into the crop_info table
-- Insert data for Paddy with Sandy, Peat, and Chalky soil types
-- Inserting data into crop_info table with more variety

INSERT INTO crop_info (crop_name, soil_type, growing_season, required_climate, steps_to_grow, fertilizers_to_use, harvesting_tips)
VALUES
    -- Paddy with Clay Soil
    ('Paddy', 'Clay', 'June to November', 'Warm and humid with good rainfall or irrigation', 
     '1. Prepare the field by plowing and leveling to ensure uniform water distribution.\n'
     '2. Transplant 20-25-day-old seedlings into wet soil, maintaining 15-20 cm spacing.\n'
     '3. Maintain a water level of 3-5 cm during early growth and increase during flowering.\n'
     '4. Apply weed control methods and regularly monitor for pests.\n'
     '5. Fertilize during tillering and panicle stages using Nitrogen and Potassium-based fertilizers.',
     'Use Urea (Nitrogen) and Potassium Chloride (MOP) at key stages to promote growth and grain filling.\n'
     'Apply organic compost to improve water retention and soil health.',
     '1. Harvest when grains turn golden-yellow.\n'
     '2. Dry harvested grains under the sun for 2-3 days to reduce moisture content.\n'
     '3. Store grains in airtight containers to prevent pest damage.'),

    -- Paddy with Loamy Soil
    ('Paddy', 'Loamy', 'June to November', 'Warm, tropical climate with consistent water supply',
     '1. Prepare the field by plowing and leveling.\n'
     '2. Transplant seedlings 20-25 days old with 15-20 cm spacing.\n'
     '3. Maintain waterlogged conditions for effective growth.\n'
     '4. Monitor for pests like rice stem borers and use organic pest control methods.',
     'Use balanced NPK fertilizers (20-10-10) during key growth stages.\n'
     'Supplement with zinc sulfate for better root development and overall growth.',
     '1. Harvest when grains are fully mature.\n'
     '2. Dry grains thoroughly before storing to prevent mold growth.\n'
     '3. Store grains in a cool, dry place to maintain quality.'),

  

    -- Cotton with Peat Soil
    ('Cotton', 'Peat', 'April to October', 'Warm climate with moderate irrigation and pH control',
     '1. Drain excess water from peat soil and add lime to balance the pH.\n'
     '2. Sow seeds in rows with proper spacing.\n'
     '3. Apply mulch to reduce weed growth and retain moisture.\n'
     '4. Irrigate as necessary to avoid overwatering, especially during dry periods.',
     'Use NPK (10-10-10) fertilizers to ensure balanced nutrient availability.\n'
     'Add gypsum to improve calcium levels and control pH balance.',
     '1. Harvest when cotton bolls are fully open.\n'
     '2. Avoid harvesting wet cotton to prevent bacterial rot.\n'
     '3. Store cotton in dry, ventilated areas to avoid mold and pest infestation.'),

    

    
     
    -- Paddy with Sandy Soil
    ('Paddy', 'Sandy', 'June to November', 'Warm and humid with moderate rainfall and good irrigation management',
     '1. Prepare the sandy soil by adding organic matter to improve water retention.\n'
     '2. Transplant 20-25-day-old seedlings into well-irrigated fields.\n'
     '3. Maintain consistent water levels, but avoid over-saturation.\n'
     '4. Weed regularly, as sandy soils can encourage weed growth.\n'
     '5. Fertilize at key growth stages like tillering and panicle formation with nitrogen-rich fertilizers.',
     'Use Urea (Nitrogen), Ammonium Nitrate, and Potassium Sulfate for balanced growth.\n'
     'Apply organic compost to increase microbial activity and soil fertility.',
     '1. Harvest when grains turn golden-yellow.\n'
     '2. Dry the harvested grains under direct sunlight for 2-3 days to reduce moisture.\n'
     '3. Store grains in cool, dry conditions to prevent mold and pest issues.'),

    -- Paddy with Peat Soil
    ('Paddy', 'Peat', 'June to November', 'Warm and humid with good rainfall, but with care to prevent waterlogging',
     '1. Mix peat soil with compost and organic matter to improve drainage.\n'
     '2. Transplant seedlings when the field is moist but not excessively flooded.\n'
     '3. Maintain water levels carefully to avoid waterlogging, which can reduce yield.\n'
     '4. Use integrated pest management to control pests in the damp conditions.',
     'Fertilize with Urea (Nitrogen), Superphosphate (Phosphorus), and Potassium Sulfate.\n'
     'Consider adding trace elements like magnesium and calcium for better root development.',
     '1. Harvest when the grains are firm, golden-yellow, and ready for drying.\n'
     '2. Dry harvested rice under the sun for 3-5 days before storage.\n'
     '3. Store in airtight containers to protect against pests and moisture.'),

    -- Cotton with Clay Soil
    ('Cotton', 'Clay', 'April to October', 'Warm and dry climate with good irrigation practices',
     '1. Loosen the clay soil by tilling deeply to improve aeration and drainage.\n'
     '2. Sow seeds 3-5 cm deep in rows spaced 75 cm apart.\n'
     '3. Irrigate consistently, especially during boll formation.\n'
     '4. Use mulch to retain moisture and regulate soil temperature.\n'
     '5. Monitor the crop for pests such as aphids and bollworms.',
     'Use Urea (Nitrogen), Potassium Sulfate, and Triple Superphosphate (TSP) to promote healthy growth.\n'
     'Add gypsum to break up clay soils and improve drainage.',
     '1. Harvest when 70-80% of bolls are open and cotton is fluffy.\n'
     '2. Dry the cotton after harvest in the sun for 1-2 days.\n'
     '3. Store cotton in dry, cool conditions to avoid mold growth and pests.'),

    -- Cotton with Loamy Soil
    ('Cotton', 'Loamy', 'April to October', 'Warm and moderate climate with good irrigation control',
     '1. Prepare the loamy soil by adding organic compost for better structure.\n'
     '2. Sow seeds at a depth of 2-4 cm, ensuring 75 cm spacing between rows.\n'
     '3. Mulch the plants to prevent weed growth and conserve moisture.\n'
     '4. Irrigate regularly during critical growth stages like flowering and boll development.\n'
     '5. Ensure proper drainage to prevent waterlogging, which can harm root health.',
     'Use Urea (Nitrogen), Potassium Nitrate, and Phosphorus-based fertilizers (Superphosphate).\n'
     'Apply foliar sprays with Zinc and Boron for improved fiber quality.',
     '1. Harvest when bolls are fully mature, open, and cotton fibers are fluffy.\n'
     '2. Use hand-picking or mechanical harvesters for efficient collection.\n'
     '3. Store cotton in well-ventilated, dry storage areas to prevent moisture-related issues.'),

    -- Cotton with sandy Soil
    ('Cotton', 'sandy', 'April to October', 'Warm and dry with occasional irrigation support',
     '1. Till sandy soil deeply to promote aeration and root growth.\n'
     '2. Add organic matter or compost to improve moisture retention and fertility.\n'
     '3. Sow seeds at a depth of 3-5 cm, with a spacing of 75 cm between rows.\n'
     '4. Water regularly, especially during dry spells.\n'
     '5. Use mulch to reduce evaporation and prevent weed growth.',
     'Fertilize with Urea (Nitrogen), Phosphorus-based fertilizers, and Potassium Sulfate to encourage healthy growth.\n'
     'Apply Zinc and Manganese to improve plant health in sandy conditions.',
     '1. Harvest when bolls are open and the cotton is soft and fluffy.\n'
     '2. Dry cotton bolls in the sun for a few days after harvesting.\n'
     '3. Store cotton in a dry, cool place to maintain quality and prevent pest infestations.'),


        -- Paddy with Chalky Soil
    ('Paddy', 'Chalky', 'June to November', 'Moderate to high humidity with regular rainfall and water management',
     '1. Add organic matter to improve fertility and texture of chalky soil.\n'
     '2. Create bunds around the field to retain water and reduce soil alkalinity.\n'
     '3. Transplant 20-25-day-old seedlings in flooded fields.\n'
     '4. Maintain a water level of 3-5 cm during early growth, and slightly increase during flowering.\n'
     '5. Monitor for pests such as brown planthopper and use integrated pest management strategies.',
     'Fertilize with a balanced NPK fertilizer (20-20-20) during key stages like tillering and flowering.\n'
     'Gypsum can be applied to manage the pH level of the soil and enhance nutrient uptake.',
     '1. Harvest when the grains are golden-yellow and firm.\n'
     '2. Dry the harvested grains under the sun for 2-3 days to reduce moisture content.\n'
     '3. Store in airtight containers to avoid pests and mold growth.'),

    -- Cotton with Chalky Soil
    ('Cotton', 'Chalky', 'April to October', 'Warm, sunny climate with good drainage and moderate rainfall',
     '1. Enrich the chalky soil with organic compost and well-rotted manure to improve structure and fertility.\n'
     '2. Sow seeds 2-4 cm deep in rows with 75 cm spacing to allow proper air circulation.\n'
     '3. Irrigate regularly, especially during the flowering and boll formation stages.\n'
     '4. Use mulch to help conserve moisture and reduce weed competition.\n'
     '5. Prune older leaves to encourage better boll development and improve airflow.',
     'Use Urea (Nitrogen) for initial growth, followed by Potassium Sulfate and Superphosphate for healthy boll development.\n'
     'Foliar applications of trace elements like Zinc and Boron can improve fiber strength and quality.',
     '1. Harvest when 70-80% of bolls are open and fluffy.\n'
     '2. Dry the harvested cotton under the sun for a couple of days to ensure proper moisture content.\n'
     '3. Store cotton in dry, cool conditions, ensuring proper ventilation to avoid mold and pest damage.');

