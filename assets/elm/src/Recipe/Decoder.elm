module Recipe.Decoder exposing (decoder)

import Recipe.Model exposing (Recipe)
import Json.Decode as Decode exposing (field, int, string)
import Json.Decode.Extra exposing ((|:))


decoder : Decode.Decoder Recipe
decoder =
    Decode.succeed
        Recipe
        |: field "id" int
        |: field "title" string
        |: field "body" string
        |: field "categories" string
        |: field "images" string
        |: field "published_at" string
