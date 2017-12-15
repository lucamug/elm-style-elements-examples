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
import Style.Transition as Transition


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


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
    | Welcome
    | BasicExampleMain
    | BasicExamplePage
    | BasicExampleLogo
    | BasicExampleNavOption
    | BasicExampleBox
    | BasicExampleContainer
    | BasicExampleLabel


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
            , Font.bold
            , Color.text Color.brown
            , hover
                [ Color.text Color.black
                ]
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
        , style Welcome
            [ Color.background Color.lightYellow
            , Font.lineHeight 1.5
            ]
        , style BasicExampleMain
            [ Border.all 1 -- set all border widths to 1 px.
            , Color.text Color.darkCharcoal
            , Color.background Color.white
            , Color.border Color.lightGrey
            , Font.typeface sansSerif
            , Font.size 16
            , Font.lineHeight 1.3 -- line height, given as a ratio of current font size.
            ]
        , style BasicExamplePage
            [ Border.all 5
            , Border.solid
            , Color.text Color.darkCharcoal
            , Color.background Color.white
            , Color.border Color.lightGrey
            ]
        , style BasicExampleLabel
            [ Font.size 25 -- set font size to 25 px
            , Font.center
            ]
        , style BasicExampleLogo
            [ Font.size 25
            , Font.typeface sansSerif
            ]
        , style BasicExampleNavOption
            [ Font.size 16
            , Font.typeface sansSerif
            ]
        , style BasicExampleBox
            [ Transition.all
            , Color.text Color.white
            , Color.background Color.blue
            , Color.border Color.blue
            , Border.rounded 3 -- round all borders to 3px
            , hover
                [ Color.text Color.white
                , Color.background Color.red
                , Color.border Color.red
                , cursor "pointer"
                ]
            ]
        , style BasicExampleContainer
            [ Color.text Color.black
            , Color.background Color.lightGrey
            , Color.border Color.lightGrey
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

                "exampleBasic" ->
                    exampleBasic

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
        , el Clickable [ onClick <| Select "exampleBasic" ] (text "Basic")
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
        textLayout Welcome
            [ height fill, spacing 20, padding 20 ]
            [ paragraph None [] <|
                [ text "This is a collection of examples built with "
                , link "http://elm-lang.org/" (el Clickable [] (text "Elm"))
                , text " and "
                , link "http://package.elm-lang.org/packages/mdgriffith/style-elements/latest/" (el Clickable [] (text "mdgriffith/style-elements"))
                , text ". In the gray section above you can see the source that generated this view. Use the menu on the right to switch among examples. Contribute with your examples at "
                , link "https://github.com/lucamug/elm-style-elements-examples" (el Clickable [] (text "elm-style-elements-examples"))
                , text "."
                ]
            , paragraph None [] <|
                [ text "Here you can find extra resources: "
                ]
            , paragraph None [] <|
                [ link "https://mdgriffith.gitbooks.io/style-elements/content/" <|
                    el Clickable [] (text "An Introduction to Style Elements")
                , text " - Online book by Matthew Griffith"
                ]
            , paragraph None [] <|
                [ link "https://youtube.com/" <|
                    el Clickable [] (text "Rethinking Style")
                , text " - Presentation at Elm Europe 2017 by Matthew Griffith"
                ]
            , paragraph None [] <|
                [ link "https://www.dailydrip.com/topics/elm/drips/style-elements" <|
                    el Clickable [] (text "Style Elements")
                , text " - Tutorial at Dailydrip"
                ]
            , paragraph None [] <|
                [ link "https://github.com/lucamug/elm-style-elements-examples/blob/master/src/Examples.elm" <|
                    el Clickable [] (text "Code of this page")
                ]
            ]
    """
    , source =
        textLayout Welcome
            [ height fill, spacing 20, padding 20 ]
            [ paragraph None [] <|
                [ text "This is a collection of examples built with "
                , link "http://elm-lang.org/" (el Clickable [] (text "Elm"))
                , text " and "
                , link "http://package.elm-lang.org/packages/mdgriffith/style-elements/latest/" (el Clickable [] (text "mdgriffith/style-elements"))
                , text ". In the gray section above you can see the source that generated this view. Use the menu on the right to switch among examples. Contribute with your examples at "
                , link "https://github.com/lucamug/elm-style-elements-examples" (el Clickable [] (text "elm-style-elements-examples"))
                , text "."
                ]
            , paragraph None [] <|
                [ text "Here you can find extra resources: "
                ]
            , paragraph None [] <|
                [ link "https://mdgriffith.gitbooks.io/style-elements/content/" <|
                    el Clickable [] (text "An Introduction to Style Elements")
                , text " - Online book by Matthew Griffith"
                ]
            , paragraph None [] <|
                [ link "https://youtube.com/" <|
                    el Clickable [] (text "Rethinking Style")
                , text " - Presentation at Elm Europe 2017 by Matthew Griffith"
                ]
            , paragraph None [] <|
                [ link "https://www.dailydrip.com/topics/elm/drips/style-elements" <|
                    el Clickable [] (text "Style Elements")
                , text " - Tutorial at Dailydrip"
                ]
            , paragraph None [] <|
                [ link "https://github.com/lucamug/elm-style-elements-examples/blob/master/src/Examples.elm" <|
                    el Clickable [] (text "Code of this page")
                ]
            ]
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
        , style Example4
            [ Background.gradient 0
                [ Background.step Color.blue
                , Background.step Color.green
                ]
            ]


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
        , style Example5
            [ Shadow.glow Color.red 5
            ]


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


exampleBasic : { source : Element Styles variation msg, text : String }
exampleBasic =
    { text = """ """
    , source =
        column None
            []
            [ -- navigation
              row None
                [ spread, paddingXY 80 20 ]
                [ el BasicExampleLogo [] (text "Style Elements")
                , row None
                    [ spacing 20, alignBottom ]
                    [ el BasicExampleNavOption [] (text "share")
                    , el BasicExampleNavOption [] (text "about")
                    , el BasicExampleNavOption [] (text "user profile")
                    ]
                ]
            , el None [ center, width (px 800) ] <|
                column BasicExampleMain
                    [ spacing 50, paddingTop 50, paddingBottom 50 ]
                    (List.concat
                        [ exampleBasicViewTextLayout
                        , exampleBasicViewRowLayouts
                        , exampleBasicViewGridLayout
                        , exampleBasicViewNamedGridLayout
                        ]
                    )
            ]
    }


{-| A text layout
-}
exampleBasicViewTextLayout : List (Element Styles variation msg)
exampleBasicViewTextLayout =
    [ el BasicExampleLabel [] (text "First, Some Text")
    , textLayout None
        [ spacingXY 25 25
        , padding 60
        ]
        [ el BasicExampleBox
            [ width (px 200)
            , height (px 300)
            , alignLeft
            ]
            (text "Alignment attributes (such as alignLeft), work in all layouts. In a text layout, the result is the element is floated left.")
        , paragraph None
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]
        , hairline BasicExampleContainer
        , paragraph None
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]
        , paragraph None
            [ width (px 500)
            , center
            ]
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]
        , paragraph None
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]
        , el BasicExampleBox
            [ width (px 200)
            , height (px 300)
            , alignRight
            , spacing 100
            ]
            empty
        , paragraph None
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]
        , paragraph None
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris vel lectus eget lorem lobortis suscipit. Fusce porta auctor purus sed tempor. Mauris auctor sapien sit amet elementum egestas. Maecenas placerat consequat mauris, at dapibus enim tristique a. Quisque feugiat ultricies lorem nec volutpat. Sed risus enim, facilisis id fermentum quis, eleifend in diam. Suspendisse euismod, urna nec consectetur volutpat, massa libero aliquam urna, hendrerit venenatis leo lacus faucibus nulla. Curabitur et mattis dolor."
            ]

        -- a "full" will expand to consume the parent padding.
        , full BasicExampleBox [] <|
            text "A Full element will grow to consume parent padding!"
        ]
    ]


exampleBasicViewRowLayouts : List (Element Styles variation msg)
exampleBasicViewRowLayouts =
    [ el BasicExampleLabel [] (text "Here is a Row Layout")
    , row BasicExampleContainer
        [ spacingXY 20 20 ]
        [ el BasicExampleBox [ width (px 100), height (px 100) ] empty
        , el BasicExampleBox [ width (px 100), height (px 100) ] empty
        , el BasicExampleBox [ width (px 100), height (px 100) ] empty
        ]
    , el BasicExampleLabel [] (text "You can Align Children Individually")
    , row BasicExampleContainer
        [ spacingXY 20 20, height (px 400) ]
        [ el BasicExampleBox [ width (px 100), height (px 100), alignTop ] (text "top")
        , el BasicExampleBox [ width (px 100), height (px 100), verticalCenter ] (text "vcenter")
        , el BasicExampleBox [ width (px 100), height (px 100), alignBottom ] (text "bottom")
        ]
    , el BasicExampleLabel [] (text "Or you can set the alignment for an entire layout.")
    , row BasicExampleContainer
        [ spacingXY 20 20, alignRight ]
        [ el BasicExampleBox [ width (px 100), height (px 100) ] empty
        , el BasicExampleBox [ width (px 100), height (px 100) ] empty
        , el BasicExampleBox [ width (px 100), height (px 100) ] empty
        ]
    ]


exampleBasicViewGridLayout : List (Element Styles variation msg)
exampleBasicViewGridLayout =
    [ el BasicExampleLabel [] (text "Grid Layout")
    , grid BasicExampleContainer
        [ spacing 20 ]
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
                , width = 1
                , height = 1
                , content = (el BasicExampleBox [] (text "box"))
                }
            , cell
                { start = ( 1, 1 )
                , width = 1
                , height = 2
                , content = (el BasicExampleBox [ spacing 100 ] (text "box"))
                }
            , cell
                { start = ( 2, 1 )
                , width = 2
                , height = 2
                , content = (el BasicExampleBox [] (text "box"))
                }
            , cell
                { start = ( 1, 0 )
                , width = 1
                , height = 1
                , content = (el BasicExampleBox [] (text "box"))
                }
            ]
        }
    ]


exampleBasicViewNamedGridLayout : List (Element Styles variation msg)
exampleBasicViewNamedGridLayout =
    [ el BasicExampleLabel [] (text "Named Grid Layout")
    , namedGrid BasicExampleContainer
        []
        { columns = [ px 200, px 200, px 200, fill ]
        , rows =
            [ px 200 => [ spanAll "header" ]
            , px 200 => [ span 3 "content", span 1 "sidebar" ]
            , px 200 => [ span 3 "content", span 1 "sidebar" ]
            , px 200 => [ spanAll "footer" ]
            ]
        , cells =
            [ named "header"
                (el BasicExampleBox [] (text "box"))
            , named "sidebar"
                (el BasicExampleBox [] (text "box"))
            ]
        }
    ]
