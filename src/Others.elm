module Main exposing (..)

import Html
import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (..)
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
    | Clickable
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
    | Code
    | LightBackground


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
    , codeBackground : Color.Color
    }
colors =
    { text = Color.rgba 120 120 120 1.0
    , mauve = Color.rgba 176 161 186 1
    , blue1 = Color.rgba 165 181 191 1
    , blue2 = Color.rgba 171 200 199 1
    , green1 = Color.rgba 184 226 200 1
    , green2 = Color.rgba 191 240 212 1
    , codeBackground = Color.rgba 240 240 240 1
    }


stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None []
        , style Main
            [ Color.text colors.text
            , Font.size 16
            ]
        , style Title
            [ Font.size 25
            , Color.text Color.brown
            , Border.bottom 2
            , Color.border colors.text
            ]
        , style Menu
            [ Color.border colors.text
            , Border.right 2
            ]
        , style Code
            [ Color.background colors.codeBackground
            , Border.bottom 2
            , Font.typeface [ Font.monospace ]
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
        , style Clickable
            [ cursor "pointer"
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
        , style LightBackground
            [ Color.background Color.lightYellow
            ]
        ]


main : Program Never { source : Element Styles variation Msg, text : String } Msg
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


update : Msg -> a -> { source : Element Styles variation msg, text : String }
update msg model =
    case msg of
        Select newView ->
            case newView of
                "exampleRow" ->
                    exampleRow

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


view : { source : Element Styles variation Msg, text : String } -> Html.Html Msg
view model =
    Element.viewport stylesheet <|
        column Main
            [ height fill ]
            [ el Title [ padding 20 ] (text "style-elements Examples")
            , row None
                [ height fill, width fill ]
                [ menu
                , column None
                    [ height fill, width fill, scrollbars ]
                    [ el Code [ height (px 150), scrollbars ] (text model.text), model.source ]
                ]
            ]


menu : Element Styles variation Msg
menu =
    column Menu
        [ scrollbars, minWidth (px 180), spacing 4, padding 20 ]
        [ el Clickable [ onClick <| Select "welcome" ] (text "🏠")
        , el Clickable [ onClick <| Select "exampleRow" ] (text "Row")
        , el Clickable [ onClick <| Select "exampleBorders" ] (text "Borders")
        , el Clickable [ onClick <| Select "exampleBackgrounds" ] (text "Backgrounds")
        , el Clickable [ onClick <| Select "exampleShadows" ] (text "Shadows")
        , el Clickable [ onClick <| Select "exampleGrid" ] (text "Grid")
        , el Clickable [ onClick <| Select "exampleChat" ] (text "Chat")
        ]


welcome : { source : Element Styles variation msg, text : String }
welcome =
    { text = """
        el None [ padding 20 ] <|
            text "Welcome"
    """
    , source =
        el None [ padding 20 ] <|
            text "Welcome"
    }


exampleRow : { source : Element Styles variation msg, text : String }
exampleRow =
    { text = """
        row LightBackground
            [ scrollbars, padding 20, spacing 10 ]
            (List.map
                (\\n ->
                    (el Example1
                        [ padding 20 ]
                        (text ("Itme " ++ toString n))
                    )
                )
                (List.range 1 10)
            )
"""
    , source =
        row LightBackground
            [ scrollbars, padding 20, spacing 10 ]
            (List.map
                (\n ->
                    (el Example1
                        [ padding 20 ]
                        (text ("Itme " ++ toString n))
                    )
                )
                (List.range 1 10)
            )
    }


exampleBorders : { source : Element Styles variation msg, text : String }
exampleBorders =
    { text = """
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


        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example1 [ padding 20 ] <|
                text "Border 1"
            , el Example2 [ padding 20 ] <|
                text "Border 2"
            , el Example3 [ padding 20 ] <|
                text "Border 3"
            ]
     """
    , source =
        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example1 [ padding 20 ] <|
                text "Border 1"
            , el Example2 [ padding 20 ] <|
                text "Border 2"
            , el Example3 [ padding 20 ] <|
                text "Border 3"
            ]
    }


exampleBackgrounds : { source : Element Styles variation msg, text : String }
exampleBackgrounds =
    { text = """
        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example4 [ padding 20 ] <|
                text "Background 1"
            ]
        """
    , source =
        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example4 [ padding 20 ] <|
                text "Background 1"
            ]
    }


exampleShadows : { source : Element Styles variation msg, text : String }
exampleShadows =
    { text = """
        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example5 [ padding 20 ] <|
                text "Shadow 1"
            ]
     """
    , source =
        column Main
            [ scrollbars, spacing 20, padding 20 ]
            [ el Example5 [ padding 20 ] <|
                text "Shadow 1"
            ]
    }


exampleGrid : { source : Element Styles variation msg, text : String }
exampleGrid =
    { text = """
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
     """
    , source =
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
    }


exampleChat : { source : Element Styles variation msg, text : String }
exampleChat =
    { text = """
        column Main
            [ height fill, width fill ]
            [ el ChatNavbar [ padding 20 ] (text "Navbar")
            , row None
                [ height fill
                , width fill
                ]
                [ column ChatSidebar
                    [ padding 20
                    , alignLeft
                    , width <| px 300
                    ]
                    [ el ChatH3 [] (text "Channels") ]
                , column None
                    [ alignLeft
                    , width fill
                    ]
                    [ column
                        ChatChat
                        [ width fill
                        , alignLeft
                        , yScrollbar
                        , padding 20
                        , spacing 10
                        ]
                        (List.map
                            (\\n ->
                                el None
                                    []
                                    (text <| "message" ++ toString n)
                            )
                         <|
                            List.range 1 100
                        )
                    , el ChatMessageBox
                        [ height <| px 200
                        , width fill
                        , verticalCenter
                        , padding 20
                        ]
                        (text "Message box")
                    ]
                , column ChatInspector
                    [ padding 20
                    , alignLeft
                    , width <| px 200
                    , height fill
                    ]
                    [ text "Inspector" ]
                ]
            ]
     """
    , source =
        column Main
            [ height fill, width fill ]
            [ el ChatNavbar [ padding 20 ] (text "Navbar")
            , row None
                [ height fill
                , width fill
                ]
                [ column ChatSidebar
                    [ padding 20
                    , alignLeft
                    , width <| px 300
                    ]
                    [ el ChatH3 [] (text "Channels") ]
                , column None
                    [ alignLeft
                    , width fill
                    ]
                    [ column
                        ChatChat
                        [ width fill
                        , alignLeft
                        , yScrollbar
                        , padding 20
                        , spacing 10
                        ]
                        (List.map
                            (\n ->
                                el None
                                    []
                                    (text <| "message" ++ toString n)
                            )
                         <|
                            List.range 1 100
                        )
                    , el ChatMessageBox
                        [ height <| px 200
                        , width fill
                        , verticalCenter
                        , padding 20
                        ]
                        (text "Message box")
                    ]
                , column ChatInspector
                    [ padding 20
                    , alignLeft
                    , width <| px 200
                    , height fill
                    ]
                    [ text "Inspector" ]
                ]
            ]
    }
