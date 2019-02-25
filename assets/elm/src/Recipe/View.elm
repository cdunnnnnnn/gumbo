module Recipe.View exposing (view, showView)

import Recipe.Model exposing (Recipe)
import Html exposing (Html, div, h3, h4, header, i, img, li, p, text, ul)
import Html.Attributes exposing (class, classList, id, src)
import Html.Events exposing (onClick)
import Messages exposing (Msg(NavigateTo))
import Model
    exposing
        ( Model
        , RemoteData(NotRequested, Requesting, Failure, Success)
        )
import Routing exposing (Route(ShowRecipeRoute))
import Shared.View


view : Model -> Html Msg
view model =
    case model.recipe of
        NotRequested ->
            text ""

        Requesting ->
            Shared.View.warningMessage
                "fa fa-spin fa-cog fa-2x fa-fw"
                "Fetching recipe"
                (text "")

        Failure error ->
            Shared.View.warningMessage
                "fa fa-meh-o fa-stack-2x"
                error
                Shared.View.backToHomeLink

        Success recipe ->
            showDetailView recipe


showView : Recipe -> ( String, Html Msg )
showView recipe =
    let
        classes =
            classList
                [ ( "card", True )
                , ( "male", recipe.gender == 0 )
                , ( "female", recipe.gender == 1 )
                ]
    in
        ( toString recipe.id
        , div [ classes, onClick (NavigateTo (ShowRecipeRoute recipe.id)) ]
            [ div [ class "inner" ]
                [ cardHeader recipe
                , cardBody recipe
                ]
            ]
        )


showDetailView : Recipe -> Html Msg
showDetailView recipe =
    let
        classes =
            classList
                [ ( "person-detail", True )
                , ( "male", recipe.gender == 0 )
                , ( "female", recipe.gender == 1 )
                ]

        ( _, content ) =
            showView recipe
    in
        div [ id "recipes_show" ]
            [ header []
                [ h3 []
                    [ text "Person detail" ]
                ]
            , Shared.View.backToHomeLink
            , div [ classes ]
                [ content ]
            ]


cardHeader : Recipe -> Html Msg
cardHeader recipe =
    let
        fullName =
            recipe.firstName ++ " " ++ recipe.lastName
    in
        header []
            [ div [ class "avatar-wrapper" ]
                [ img [ class "avatar", src recipe.picture ] [] ]
            , div [ class "info-wrapper" ]
                [ h4 []
                    [ text fullName ]
                , ul [ class "meta" ]
                    [ li []
                        [ i [ class "fa fa-map-marker" ] []
                        , text recipe.location
                        ]
                    , li []
                        [ i [ class "fa fa-birthday-cake" ] []
                        , text recipe.birthDate
                        ]
                    ]
                ]
            ]


cardBody : Recipe -> Html Msg
cardBody recipe =
    div [ class "card-body" ]
        [ div [ class "headline" ]
            [ p []
                [ text recipe.headline ]
            ]
        , ul [ class "recipe-info" ]
            [ li []
                [ i [ class "fa fa-phone" ] []
                , text recipe.phoneNumber
                ]
            , li []
                [ i [ class "fa fa-envelope" ] []
                , text recipe.email
                ]
            ]
        ]
