module Recipe.Messages exposing (RecipeMsg(..))

import Recipe.Model exposing (Recipe)
import Http


type RecipeMsg
    = FetchRecipe (Result Http.Error Recipe)
