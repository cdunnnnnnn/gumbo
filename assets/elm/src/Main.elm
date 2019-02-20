module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

main =
  div [ class "mx-auto max-w-md" ]
  [
    input [ type_ "text", class "appearance-none shadow-md rounded-sm hover:border-purple border mb-4 p-2 w-full", placeholder "What do you want to do?" ] []
    , div [ class "bg-white shadow-lg rounded-lg overflow-hidden hover:border-purple border" ]
    [
      div [ class "sm:flex sm:items-center px-6 py-4" ]
      [
        div [ class "relative block w-16 sm:w-24 h-16 sm:h-24 rounded-full border-purple border-2 overflow-hidden mb-4 sm:mb-0 sm:mr-4 sm:ml-0" ] [
          img [ class "absolute pin block min-w-full min-h-full m-auto", src "https://images.unsplash.com/photo-1506617564039-2f3b650b7010?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80", alt "" ] []
        ]
        , div [ class "text-center sm:text-left sm:flex-grow" ]
        [
          div [ class "mb-4" ]
          [
            p [ class "text-xl leading-tight" ] [ text "Grocery Shopping" ]
            , p [ class "text-sm leading-tight text-grey-dark" ] [ text "Go to Lucky's Market" ]
            , p [ class "text-sm leading-tight text-grey-dark" ] [ text "Mon, 2/23/19" ]
          ]
        ]
        , button [ class "text-xs font-semibold rounded-full px-4 py-1 leading-normal bg-white border border-purple text-purple hover:bg-purple hover:text-white" ] [ text "Done" ]
      ]
    ]
  ]
