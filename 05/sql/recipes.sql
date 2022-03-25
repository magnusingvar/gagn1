SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT DISTINCT
    Recipe_Classes.RecipeClassID,
    Recipe_Classes.RecipeClassDescription
FROM
    Recipe_Classes LEFT OUTER JOIN Recipes
    ON Recipe_Classes.RecipeClassID = Recipes.RecipeClassID 
WHERE 
    Recipe_Classes.RecipeClassID LIKE 7;

-- 2. 
SELECT
    Recipes.RecipeID AS "Recipe ID",
    Ingredients.IngredientName AS "Ingredient Name",
    Recipes.RecipeTitle AS "Recipe Title"
FROM 
    Recipes INNER JOIN Ingredients
    ON Recipes.RecipeID = Ingredients.IngredientID
    LEFT OUTER JOIN Recipe_Ingredients
    ON Recipe_Ingredients.IngredientID = Ingredients.IngredientID;

-- 3. 
SELECT DISTINCT
    Recipes.RecipeID AS "ID",
    Recipes.RecipeTitle AS "Title",
    Recipe_Classes.RecipeClassID AS "Class ID",
    Recipe_Classes.RecipeClassDescription AS "Description"
FROM
    Recipes LEFT OUTER JOIN Recipe_Classes
WHERE
    Recipe_Classes.RecipeClassDescription LIKE "Salad" OR
    Recipe_Classes.RecipeClassDescription LIKE "Soup" OR
    Recipe_Classes.RecipeClassDescription LIKE "Main course"
ORDER BY 
    Recipe_Classes.RecipeClassID;
    
-- 4.
SELECT
    Recipes.RecipeID AS "ID",
    Recipes.RecipeTitle AS "Title",
    Recipe_Classes.RecipeClassID AS "Class ID",
    Recipe_Classes.RecipeClassDescription AS "Description"
FROM
    Recipes  INNER JOIN Recipe_Classes
    ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID
ORDER BY 
    Recipe_Classes.RecipeClassID DESC;