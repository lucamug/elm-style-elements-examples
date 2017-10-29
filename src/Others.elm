module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Border as Border
import Style.Background as Background
import Style.Color as Color
import Style.Font as Font
import Style.Shadow as Shadow


type Styles
    = None
    | Main
    | Title
    | Example1
    | Example2
    | Example3
    | Example4
    | Example5
    | BackgroundPurple


sansSerif : List Font
sansSerif =
    [ Font.font "helvetica"
    , Font.font "arial"
    , Font.font "sans-serif"
    ]


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Main
            [ Color.text Color.darkGrey
            ]
        , style Title
            [ Font.size 25
            , Color.text Color.brown
            ]
        , style BackgroundPurple
            [ Color.background Color.purple
            ]
        , style Example1
            [ Border.all 1
            , Color.border Color.red
            ]
        , style Example2
            [ Border.left 10
            , Border.dashed
            , Color.border Color.green
            ]
        , style Example3
            [ Border.all 5
            , Border.rounded 30
            , Border.dotted
            , Color.border Color.lightOrange
            ]
        , style Example4
            [ Background.gradient 0 [ Background.step Color.blue, Background.step Color.green ]
            ]
        , style Example5
            [ Shadow.glow Color.red 5
            ]
        ]


main : Program Never number (number -> number)
main =
    Html.beginnerProgram
        { model = 0
        , update = (\x -> x)
        , view = view
        }


format : List (Element.Attribute variation msg)
format =
    [ padding 20, width fill ]


view : a -> Html.Html msg
view _ =
    Element.layout stylesheet <|
        column Main
            []
            [ column Main
                [ spacing 20, padding 20, spread ]
                [ el Title format <|
                    text "Borders"
                , el Example1 format <|
                    text """[ Border.all 1
, Color.border Color.red
]"""
                , el Example2 format <|
                    text """[ Border.left 10
, Border.dashed
, Color.border Color.green
]"""
                , el Example3 format <|
                    text """[ Border.all 5
, Border.rounded 50
, Border.dotted
, Color.border Color.lightOrange
]"""
                , el Title format <|
                    text "Backgrounds"
                , el Example4 format <|
                    text """[ Background.gradient 0 [ Background.step Color.blue, Background.step Color.green ]
]"""
                , el Title format <|
                    text "Shadows"
                , el Example5 format <|
                    text """[ Shadow.glow Color.red 5
]"""
                , row BackgroundPurple
                    [ spacing 20, padding 20, spread ]
                    [ el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    , el Example1 format <|
                        text "text"
                    ]
                ]
            ]
