module Recipe.Commands exposing (fetchRecipe)

import Commands exposing (recipesApiUrl)
import Recipe.Decoder as Decoder
import Recipe.Messages exposing (RecipeMsg(FetchRecipe))
import Http
import Messages exposing (Msg(RecipeMsg))

fetchRecipe : Int Cmd Msg
fetchRecipe id =
  let
    apiUrl =
      recipesApiUrl ++ "/" ++ toString id

  in
    Decoder.decoder
      |> Http.get apiUrl
      |> Http.send FetchRecipe
      |> Cmd.map RecipeMsg
