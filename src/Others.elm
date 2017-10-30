module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (..)
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
    | ChatContainer
    | ChatLabel
    | ChatNavbar
    | ChatSidebar
    | ChatInspector
    | ChatMessageBox
    | ChatChat
    | ChatMain
    | ChatH3
    | MyGridStyle
    | Box


sansSerif : List Font
sansSerif =
    [ Font.font "helvetica"
    , Font.font "arial"
    , Font.font "sans-serif"
    ]


colors :
    { text : Color.Color
    , blue1 : Color.Color
    , green1 : Color.Color
    , green2 : Color.Color
    , mauve : Color.Color
    , blue2 : Color.Color
    }
colors =
    { text = Color.rgba 88 39 39 0.5
    , mauve = Color.rgba 176 161 186 1
    , blue1 = Color.rgba 165 181 191 1
    , blue2 = Color.rgba 171 200 199 1
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
        , style ChatContainer
            [ Color.text Color.black
            , Color.background colors.blue2
            , Color.border Color.lightGrey
            ]
        , style ChatChat
            [ Color.background colors.blue1
            ]
        , style ChatNavbar
            [ Color.background colors.mauve
            ]
        , style ChatSidebar
            [ Color.background colors.green1
            ]
        , style ChatInspector
            [ Color.background colors.green2
            ]
        , style ChatMessageBox
            [ Color.background colors.blue2 ]
        , style ChatMain
            [ Font.typeface [ Font.font "helvetica" ] ]
        , style ChatH3
            [ Font.size 20, Font.weight 400 ]
        , style MyGridStyle
            [ Color.border Color.green
            , Border.all 3
            ]
        , style Box
            [ Color.border Color.red
            , Border.all 3
            ]
        ]


main : Program Never (Element Styles variation Msg) Msg
main =
    Html.beginnerProgram
        { model = welcome
        , view = view
        , update = update
        }


type Msg
    = Select String


type alias Model variation msg =
    Element Styles variation msg


update : Msg -> Model variation Msg -> Model variation Msg
update msg model =
    case msg of
        Select newView ->
            case newView of
                "example1" ->
                    example1

                "exampleBorders" ->
                    exampleBorders

                "exampleBackgrounds" ->
                    exampleBackgrounds

                "exampleShadows" ->
                    exampleShadows

                "exampleGrid" ->
                    exampleGrid

                "exampleChat" ->
                    exampleChat

                _ ->
                    welcome


format : List (Element.Attribute variation Msg)
format =
    [ padding 20, width fill ]


attributesMenuList : List (Element.Attribute variation Msg)
attributesMenuList =
    []


view : Model variation Msg -> Html.Html Msg
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
                , model
                ]
            ]


menu : Element Styles variation Msg
menu =
    column Menu
        [ scrollbars, minWidth (px 180), spacing 20, padding 20 ]
        [ link "#" <| el None [ onClick <| Select "welcome" ] (text "🏠")
        , link "#" <| el None [ onClick <| Select "example1" ] (text "Row")
        , link "#" <| el None [ onClick <| Select "exampleBorders" ] (text "Borders")
        , link "#" <| el None [ onClick <| Select "exampleBackgrounds" ] (text "Backgrounds")
        , link "#" <| el None [ onClick <| Select "exampleShadows" ] (text "Shadows")
        , link "#" <| el None [ onClick <| Select "exampleGrid" ] (text "Grid")
        , link "#" <| el None [ onClick <| Select "exampleChat" ] (text "Chat")
        ]


welcome : Element Styles variation Msg
welcome =
    el None [ padding 20 ] <|
        text "Welcome"


example1 : Element Styles variation Msg
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


exampleBorders : Element Styles variation Msg
exampleBorders =
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


exampleBackgrounds : Element Styles variation Msg
exampleBackgrounds =
    column Main
        [ scrollbars, spacing 20, padding 20 ]
        [ el Example4 [ padding 20 ] <|
            text """[ Background.gradient 0 [ Background.step Color.blue, Background.step Color.green ]
]"""
        ]


exampleShadows : Element Styles variation Msg
exampleShadows =
    column Main
        [ scrollbars, spacing 20, padding 20 ]
        [ el Example5 [ padding 20 ] <|
            text """[ Shadow.glow Color.red 5
]"""
        ]


exampleGrid : Element Styles variation Msg
exampleGrid =
    grid MyGridStyle
        []
        { columns = [ px 100, px 100, px 100, px 100 ]
        , rows =
            [ px 100
            , px 100
            , px 100
            , px 100
            ]
        , cells =
            [ cell
                { start = ( 0, 0 )
                , width = 4
                , height = 1
                , content = el Box [] (text "box1")
                }
            , cell
                { start = ( 0, 1 )
                , width = 1
                , height = 2
                , content = el Box [] (text "box2")
                }
            , cell
                { start = ( 0, 3 )
                , width = 1
                , height = 1
                , content = el Box [] (text "box3")
                }
            , cell
                { start = ( 1, 1 )
                , width = 3
                , height = 3
                , content = el Box [] (text "box4")
                }
            ]
        }


exampleChat : Element Styles variation Msg
exampleChat =
    column Main
        [ height fill ]
        [ el ChatNavbar [ padding 20 ] (text "Navbar")
        , row None
            [ height fill
            , width fill
            ]
            [ chatSidebar, chatBody, chatInspector ]
        ]


chatSidebar : Element Styles variation Msg
chatSidebar =
    column ChatSidebar
        [ padding 20
        , alignLeft
        , width <| px 300
        ]
        [ el ChatH3 [] (text "Channels") ]


chatInspector : Element Styles variation Msg
chatInspector =
    column ChatInspector
        [ padding 20
        , alignLeft
        , width <| px 200
        , height fill
        ]
        [ text "Inspector" ]


chatBody : Element Styles variation Msg
chatBody =
    column None
        [ alignLeft
        , width fill
        ]
        [ chatMessages, chatMessageBox ]


chatMessages : Element Styles variation Msg
chatMessages =
    column
        ChatChat
        [ width fill
        , alignLeft
        , yScrollbar
        ]
        (List.map chatMessage <| List.range 1 100)


chatMessage : a -> Element Styles variation Msg
chatMessage n =
    el None
        [ padding 10 ]
        (text <| "message" ++ toString n)


chatMessageBox : Element Styles variation Msg
chatMessageBox =
    el ChatMessageBox
        [ height <| px 300
        , width fill
        , verticalCenter
        ]
        (text "Message box")
