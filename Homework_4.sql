CREATE OR REPLACE TABLE raw_data AS
SELECT *
FROM read_json_auto("/Users/taniatkachenko2501/Desktop/steam_2025_5k-dataset-reviews_20250901.json",
                   maximum_object_size = 268435456)
        LIMIT 5;
-- I wanted to check structure of my database
PRAGMA table_info('mydb');

CREATE OR REPLACE TABLE metadata_unnested AS
SELECT UNNEST(raw_data.metadata) AS game
FROM raw_data;

CREATE TABLE games_unnested AS
SELECT UNNEST(mydb.games) AS game
FROM mydb;

-- At first, I selected all data that has simple structure and to work with it it doesn't needed to use unnset and json_extract
CREATE OR REPLACE TABLE games_base_unnested AS
SELECT
   game.appid AS game_appid,
   game.name_from_applist,
   game.app_details.appid AS details_appid,
   game.app_details.success AS details_success,
   game.app_details.fetched_at,
   game.app_details.data."type" AS data_type,
   game.app_details.data."name" AS data_name,
   game.app_details.data.steam_appid,
   game.app_details.data.is_free,
   game.app_details.data.detailed_description,
   game.app_details.data.about_the_game,
   game.app_details.data.short_description,
   game.app_details.data.header_image,
   game.app_details.data.capsule_image,
   game.app_details.data.website,
   game.app_details.data.fullgame.appid AS fullgame_appid,
   game.app_details.data.fullgame.name AS fullgame_name,
   game.app_details.data.platforms.windows AS platform_windows,
   game.app_details.data.platforms.mac AS platform_mac,
   game.app_details.data.platforms.linux AS platform_linux,
   game.app_details.data.release_date.coming_soon AS release_coming_soon,
   game.app_details.data.release_date.date AS release_date,
   game.app_details.data.support_info.url AS support_url,
   game.app_details.data.support_info.email AS support_email,
   game.app_details.data.price_overview.currency AS price_currency,
   game.app_details.data.price_overview.initial AS price_initial_cents,
   game.app_details.data.price_overview.final AS price_final_cents,
   game.app_details.data.price_overview.discount_percent AS price_discount_percent,
   game.app_details.data.price_overview.final_formatted AS price_final_formatted,
   game.app_details.data.metacritic.score AS metacritic_score,
   game.app_details.data.metacritic.url AS metacritic_url,
   game.app_details.data.recommendations.total AS recommendations_total,
   game.app_details.data.achievements.total AS achievements_total,
   game.app_details.data.developers,
   game.app_details.data.publishers,
   game.app_details.data.categories,
   game.app_details.data.genres,
   game.app_details.data.screenshots,
   game.app_details.data.movies,
   game.app_details.data.demos,
   game.app_details.data.achievements.highlighted,
FROM games_unnested;

-- After this I started unpacking all data that left (I cheked in select which rows are exactly json and worked with it)
CREATE OR REPLACE TABLE games_developers AS
SELECT
   game1.game_appid,
   dev_name AS developer_name
FROM games_base_unnested AS game1,
    UNNEST(game1.developers) AS dev_name;

CREATE OR REPLACE TABLE games_publishers AS
SELECT
   game1.game_appid,
   pub_name AS publisher_name
FROM games_base_unnested AS game1,
    UNNEST(game1.publishers) AS pub_name;

CREATE OR REPLACE TABLE games_genres AS
SELECT
   game1.game_appid,
   CAST(JSON_EXTRACT_STRING(genre, '$.id') AS BIGINT) AS genre_id,
   JSON_EXTRACT_STRING(genre, '$.description') AS genre_description
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.genres) AS genre ON TRUE
WHERE game1.genres IS NOT NULL AND ARRAY_LENGTH(game1.genres) > 0;

CREATE OR REPLACE TABLE games_categories AS
SELECT
   game1.game_appid,
   CAST(JSON_EXTRACT_STRING(category, '$.id') AS BIGINT) AS category_id,
   JSON_EXTRACT_STRING(category, '$.description') AS category_description
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.categories) AS category ON TRUE
WHERE game1.categories IS NOT NULL AND ARRAY_LENGTH(game1.categories) > 0;

CREATE OR REPLACE TABLE games_screenshots AS
SELECT
   game1.game_appid,
   CAST(JSON_EXTRACT_STRING(screen, '$.id') AS BIGINT) AS screenshot_id,
   JSON_EXTRACT_STRING(screen, '$.path_thumbnail') AS thumbnail_url,
   JSON_EXTRACT_STRING(screen, '$.path_full') AS full_image_url
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.screenshots) AS screen ON TRUE
WHERE game1.screenshots IS NOT NULL AND ARRAY_LENGTH(game1.screenshots) > 0;

CREATE OR REPLACE TABLE games_achievements_highlighted AS
SELECT
   game1.game_appid,
   JSON_EXTRACT_STRING(ach, '$.name') AS achievement_name,
   JSON_EXTRACT_STRING(ach, '$.path') AS achievement_path
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.highlighted) AS ach ON TRUE
WHERE game1.highlighted IS NOT NULL AND ARRAY_LENGTH(game1.highlighted) > 0;

CREATE OR REPLACE TABLE games_demos AS
SELECT
   game1.game_appid,
   CAST(JSON_EXTRACT_STRING(demo, '$.appid') AS BIGINT) AS demo_appid,
   JSON_EXTRACT_STRING(demo, '$.description') AS demo_description
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.demos) AS demo ON TRUE
WHERE game1.demos IS NOT NULL AND ARRAY_LENGTH(game1.demos) > 0;

CREATE OR REPLACE TABLE games_movies AS
SELECT
   game1.game_appid,
   CAST(JSON_EXTRACT_STRING(mov, '$.id') AS BIGINT) AS movie_id,
   JSON_EXTRACT_STRING(mov, '$.name') AS movie_name,
   JSON_EXTRACT_STRING(mov, '$.thumbnail') AS movie_thumbnail_url,
   CAST(JSON_EXTRACT_STRING(mov, '$.highlight') AS BOOLEAN) AS movie_is_highlighted,
   JSON_EXTRACT_STRING(mov, '$.webm."480"') AS webm_480_url,
   JSON_EXTRACT_STRING(mov, '$.webm.max') AS webm_max_url,
   JSON_EXTRACT_STRING(mov, '$.mp4."480"') AS mp4_480_url,
   JSON_EXTRACT_STRING(mov, '$.mp4.max') AS mp4_max_url
FROM games_base_unnested AS game1
        LEFT JOIN UNNEST(game1.movies) AS mov ON TRUE
WHERE game1.movies IS NOT NULL AND ARRAY_LENGTH(game1.movies) > 0;

-- Finally I joined all the data that I have
CREATE OR REPLACE TABLE final_table AS
SELECT (*)
FROM games_base_unnested AS base
        LEFT JOIN games_developers AS dev ON base.game_appid = dev.game_appid
        LEFT JOIN games_publishers AS pub ON base.game_appid = pub.game_appid
        LEFT JOIN games_genres AS genre ON base.game_appid = genre.game_appid
        LEFT JOIN games_categories AS cat ON base.game_appid = cat.game_appid
        LEFT JOIN games_screenshots AS scr ON base.game_appid = scr.game_appid
        LEFT JOIN games_movies AS mov ON base.game_appid = mov.game_appid
        LEFT JOIN games_demos AS demo ON base.game_appid = demo.game_appid;

-- Check the distribution between platforms
SELECT
   SUM(CASE WHEN platform_windows = TRUE THEN 1 ELSE 0 END) AS games_for_windows,
   SUM(CASE WHEN platform_mac = TRUE THEN 1 ELSE 0 END) AS games_for_mac,
   SUM(CASE WHEN platform_linux = TRUE THEN 1 ELSE 0 END) AS games_for_linux,
   COUNT(DISTINCT game_appid) AS total_unique_games
FROM final_table;

-- Average rating for genre
SELECT
   genre_description,
   AVG(metacritic_score) AS average_metacritic_score,
   COUNT(DISTINCT game_appid) AS games_in_genre_with_score
FROM final_table
WHERE metacritic_score IS NOT NULL AND metacritic_score > 0
GROUP BY genre_description
HAVING games_in_genre_with_score >= 1
ORDER BY average_metacritic_score DESC
LIMIT 1;

-- Max price for game in spesific category
SELECT
   category_description,
   MAX(price_initial_cents) AS max_price_in_cents
FROM final_table
WHERE price_initial_cents IS NOT NULL
GROUP BY category_description
ORDER BY max_price_in_cents DESC;

-- Distribution by popularity
SELECT
   CASE
       WHEN recommendations_total IS NULL OR recommendations_total = 0 THEN 'No Data'
       WHEN recommendations_total < 100 THEN 'Low (<100)'
       WHEN recommendations_total BETWEEN 100 AND 1000 THEN 'Medium (100-1K)'
       WHEN recommendations_total BETWEEN 1001 AND 10000 THEN 'High (1K-10K)'
       ELSE 'Very High (>10K)'
       END AS popularity_segment,
   COUNT(game_appid) AS game_count
FROM final_table
GROUP BY popularity_segment;

-- Average discount for games
SELECT
   data_name AS game_title,
   AVG(price_discount_percent) AS avg_discount_percent
FROM final_table
GROUP BY data_name
ORDER BY avg_discount_percent DESC
LIMIT 5;




-- It is extracted structure of my data

STRUCT(run_start_timestamp_utc VARCHAR, 
run_end_timestamp_utc VARCHAR, 
run_duration_seconds DOUBLE, 
target_game_count BIGINT, 
total_records_processed BIGINT, 
successful_games_found BIGINT, 
api_key_used VARCHAR, 
delay_between_requests DOUBLE)



STRUCT(
    appid BIGINT, аваав
    name_from_applist VARCHAR, 
    app_details STRUCT(
        appid BIGINT, 
        success BOOLEAN, 
        fetched_at VARCHAR,
        "data" STRUCT(
            "type" VARCHAR, 
            "name" VARCHAR, 
            steam_appid BIGINT, 
            required_age JSON, 
            is_free BOOLEAN, 
            detailed_description VARCHAR, 
            about_the_game VARCHAR, 
            short_description VARCHAR, 
            fullgame STRUCT(appid VARCHAR, "name" VARCHAR),   
            header_image VARCHAR, 
            capsule_image VARCHAR, 
            capsule_imagev5 VARCHAR, 
            website VARCHAR, 
            pc_requirements JSON, 
            mac_requirements JSON, 
            linux_requirements JSON, 
            developers VARCHAR[], 
            publishers VARCHAR[], 
            package_groups STRUCT(                     
                "name" VARCHAR, 
                title VARCHAR, 
                description VARCHAR, 
                selection_text VARCHAR, 
                save_text VARCHAR, 
                display_type JSON, 
                is_recurring_subscription VARCHAR, 
                subs STRUCT(                             
                    packageid BIGINT, 
                    percent_savings_text VARCHAR, 
                    percent_savings BIGINT, 
                    option_text VARCHAR, 
                    option_description VARCHAR, 
                    can_get_free_license VARCHAR, 
                    is_free_license BOOLEAN, 
                    price_in_cents_with_discount BIGINT
                )[]
            )[],
            platforms STRUCT(windows BOOLEAN, mac BOOLEAN, linux BOOLEAN),   
            categories STRUCT(id BIGINT, description VARCHAR)[],              
            release_date STRUCT(coming_soon BOOLEAN, date VARCHAR),         
            support_info STRUCT(url VARCHAR, email VARCHAR),                 
            content_descriptors STRUCT(ids BIGINT[], notes VARCHAR),          
            ratings STRUCT(                                                   
                dejus STRUCT(...), steam_germany STRUCT(...), esrb STRUCT(...), ...),
            genres STRUCT(id VARCHAR, description VARCHAR)[],                
            screenshots STRUCT(id BIGINT, path_thumbnail VARCHAR, path_full VARCHAR)[], 
            movies STRUCT(id BIGINT, "name" VARCHAR, thumbnail VARCHAR, webm STRUCT("480" VARCHAR, max VARCHAR), mp4 STRUCT("480" VARCHAR, max VARCHAR), highlight BOOLEAN)[],
            price_overview STRUCT(currency VARCHAR, initial BIGINT, final BIGINT, discount_percent BIGINT, initial_formatted VARCHAR, final_formatted VARCHAR, recurring_sub BIGINT, recurring_sub_desc VARCHAR), 
            achievements STRUCT(total BIGINT, highlighted STRUCT("name" VARCHAR, path VARCHAR)[]),
            recommendations STRUCT(total BIGINT),   
            demos STRUCT(appid BIGINT, description VARCHAR)[], 
            metacritic STRUCT(score BIGINT, url VARCHAR)      
        )
    )
)








