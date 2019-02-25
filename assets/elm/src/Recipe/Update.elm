module Recipe.Update exposing (update)

import Recipe.Messages exposing (RecipeMsg(FetchRecipe))
import Messages exposing (Msg)
import Model exposing (Model, RemoteData(Failure, Success))


update : RecipeMsg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchRecipe (Ok response) ->
            ( { model | recipe = Success response }, Cmd.none )

        FetchRecipe (Err _) ->
            ( { model | recipe = Failure "Recipe not found" }, Cmd.none )
