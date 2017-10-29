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
    | Menu
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


colors :
    { text : Color.Color
    , green1 : Color.Color
    , green2 : Color.Color
    }
colors =
    { text = Color.rgba 88 39 39 0.5
    , green1 = Color.rgba 184 226 200 1
    , green2 = Color.rgba 191 240 212 1
    }


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Main
            [ Color.text colors.text
            , Font.size 20
            ]
        , style Title
            [ Font.size 25
            , Color.text Color.brown
            , Border.bottom 2
            ]
        , style Menu
            [ Color.text Color.brown
            , Border.right 2
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


attributesMenuList : List (Element.Attribute variation msg)
attributesMenuList =
    []


view : a -> Html.Html msg
view model =
    Element.viewport stylesheet <|
        column Main
            [ height fill ]
            [ el Title [ padding 20 ] (text "style-elements Examples")
            , row None
                [ height fill
                , width fill
                ]
                [ menu
                , example2
                ]
            ]


menu : Element Styles variation msg
menu =
    column Menu
        [ scrollbars, minWidth (px 180), spacing 20, padding 20 ]
        [ el None attributesMenuList (text "Example 1")
        , el None attributesMenuList (text "Example 2")
        , el None attributesMenuList (text "Example 3")
        , el None attributesMenuList (text "Example 4")
        , el None attributesMenuList (text "Example 5")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        , el None attributesMenuList (text "Example 6")
        ]


example1 : Element Styles variation msg
example1 =
    row None
        [ scrollbars, spacing 20, padding 20 ]
        [ el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        , el Example1 [ padding 20, width fill ] <|
            text "text"
        ]


example2 : Element Styles variation msg
example2 =
    column Main
        [ scrollbars, spacing 20, padding 20 ]
        [ el Example1 [ padding 20 ] <|
            text """[ Border.all 1
, Color.border Color.red
]"""
        , el Example2 [ padding 20 ] <|
            text """[ Border.left 10
, Border.dashed
, Color.border Color.green
]"""
        , el Example3 [ padding 20 ] <|
            text """[ Border.all 5
, Border.rounded 50
, Border.dotted
, Color.border Color.lightOrange
]"""
        , el Title [ padding 20 ] <|
            text "Backgrounds"
        , el Example4 [ padding 20 ] <|
            text """[ Background.gradient 0 [ Background.step Color.blue, Background.step Color.green ]
]"""
        , el Title [ padding 20 ] <|
            text "Shadows"
        , el Example5 [ padding 20 ] <|
            text """[ Shadow.glow Color.red 5
]"""
        ]


view2 : a -> Html.Html msg
view2 _ =
    Element.layout stylesheet <|
        column Main
            [ height fill ]
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
                ]
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
