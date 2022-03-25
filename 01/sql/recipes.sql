SELECT
    Name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1.
SELECT IngredientName
FROM Ingredients;

-- 2.
SELECT *
FROM Recipes
ORDER BY RecipeTitle;