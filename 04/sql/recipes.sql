SELECT
    name
FROM
    sqlite_master
WHERE
    type = 'table' AND
    name NOT LIKE 'sqlite_%';

-- 1. 
SELECT
    Recipes.RecipeTitle
FROM   
    Recipes INNER JOIN Recipe_Classes
    ON Recipes.RecipeClassID = Recipe_Classes.RecipeClassID
WHERE 
    Recipe_Classes.RecipeClassDescription = "Salad";

-- 2.
SELECT
    rec.RecipeTitle, ing.IngredientName
FROM
    Recipes AS rec INNER JOIN Ingredients AS ing
WHERE 
    ing.IngredientClassID LIKE 8;

-- 3.
SELECT
    ing.IngredientName, ing.MeasureAmountID,
    meas.MeasureAmountID
FROM
    Ingredients ing INNER JOIN Measurements meas
    ON ing.MeasureAmountID = meas.MeasureAmountID
WHERE
    ing.MeasureAmountID LIKE meas.MeasureAmountID
ORDER BY 
    ing.MeasureAmountID;

-- 4. 
SELECT
    beef.RecipeTitle AS "Uppskrift",
    beef.IngredientName AS "Hráefni 01",
    garlic.IngredientName AS "Hráefni 02"
FROM
    (SELECT
        Recipes.RecipeTitle, Ingredients.IngredientName
    FROM 
        Ingredients INNER JOIN Recipe_Ingredients
        ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
        INNER JOIN Recipes
        ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
    WHERE
        Ingredients.IngredientName = "Garlic") AS "garlic"
INNER JOIN
    (SELECT
        Recipes.RecipeTitle, Ingredients.IngredientName
    FROM 
        Ingredients INNER JOIN Recipe_Ingredients
        ON Ingredients.IngredientID = Recipe_Ingredients.IngredientID
        INNER JOIN Recipes
        ON Recipe_Ingredients.RecipeID = Recipes.RecipeID
    WHERE
        Ingredients.IngredientName = "Beef") AS "beef"
    ON garlic.RecipeTitle = beef.RecipeTitle;