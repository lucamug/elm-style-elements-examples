module Main exposing (..)

import Html
import Color exposing (rgba)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Color as Color
import Style.Font as Font


type Styles
    = None
    | Container
    | Label
    | Navbar
    | Sidebar
    | Inspector
    | MessageBox
    | Chat
    | Main
    | H3


colors :
    { blue1 : Color.Color
    , green1 : Color.Color
    , green2 : Color.Color
    , mauve : Color.Color
    , blue2 : Color.Color
    }
colors =
    { mauve = rgba 176 161 186 1
    , blue1 = rgba 165 181 191 1
    , blue2 = rgba 171 200 199 1
    , green1 = rgba 184 226 200 1
    , green2 = rgba 191 240 212 1
    }


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Container
            [ Color.text Color.black
            , Color.background colors.blue2
            , Color.border Color.lightGrey
            ]
        , style Chat
            [ Color.background colors.blue1
            ]
        , style Navbar
            [ Color.background colors.mauve
            ]
        , style Sidebar
            [ Color.background colors.green1
            ]
        , style Inspector
            [ Color.background colors.green2
            ]
        , style MessageBox
            [ Color.background colors.blue2 ]
        , style Main
            [ Font.typeface [ Font.font "helvetica" ] ]
        , style H3
            [ Font.size 20, Font.weight 400 ]
        ]


main : Html.Html msg
main =
    Element.viewport stylesheet <|
        column Main
            [ height fill ]
            [ navbar
            , row None
                [ height fill
                , width fill
                ]
                [ sidebar, body, inspector ]
            ]


navbar : Element Styles variation msg
navbar =
    el Navbar [ padding 20 ] (text "Navbar")


sidebar : Element Styles variation msg
sidebar =
    column Sidebar
        [ padding 20
        , alignLeft
        , width <| px 300
        ]
        [ el H3 [] (text "Channels") ]


inspector : Element Styles variation msg
inspector =
    column Inspector
        [ padding 20
        , alignLeft
        , width <| px 200
        , height fill
        ]
        [ text "Inspector" ]


body : Element Styles variation msg
body =
    column None
        [ alignLeft
        , width fill
        ]
        [ messages, messageBox ]


messages : Element Styles variation msg
messages =
    column
        Chat
        [ width fill
        , alignLeft
        , yScrollbar
        ]
        (List.map message <| List.range 1 100)


message : a -> Element Styles variation msg
message n =
    el None
        [ padding 10 ]
        (text <| "message" ++ toString n)


messageBox : Element Styles variation msg
messageBox =
    el MessageBox
        [ height <| px 300
        , width fill
        , verticalCenter
        ]
        (text "Message box")
