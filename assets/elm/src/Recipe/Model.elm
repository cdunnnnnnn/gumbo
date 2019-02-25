module Recipe.Model exposing (Recipe)


type alias Recipe =
    { id : Int
    , title : String
    , body : String
    , categories : Int
    , images : String
    , publishedAt : String
    }
