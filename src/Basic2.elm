module Main exposing (..)

import Color
import Element exposing (..)
import Element.Attributes exposing (..)
import Html
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Transition as Transition


(=>) : a -> b -> ( a, b )
(=>) =
    (,)


type Styles
    = None
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


{-| First, we create a stylesheet.

Styles only deal with properties that are not related to layout, position, or size.

Generally all properties only have one allowed unit, which is usually px.

If you want to use something like em

-}
stylesheet : StyleSheet Styles variation
stylesheet =
    Style.styleSheet
        [ style None [] -- It's handy to have a blank style
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


main : Program Never number (number -> number)
main =
    Html.beginnerProgram
        { model = 0
        , update = (\x -> x)
        , view = view
        }


{-| Our view is made up of `Element`s,

which you can think of as Html with layout, positioning, and spacing built in.

-}
view : a -> Html.Html msg
view _ =
    basicExample


basicExample : Html.Html msg
basicExample =
    Element.layout stylesheet <|
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
                        [ basicExampleViewTextLayout
                        , basicExampleViewRowLayouts
                        , basicExampleViewGridLayout
                        , basicExampleViewNamedGridLayout
                        ]
                    )
            ]


{-| A text layout
-}
basicExampleViewTextLayout : List (Element Styles variation msg)
basicExampleViewTextLayout =
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


basicExampleViewRowLayouts : List (Element Styles variation msg)
basicExampleViewRowLayouts =
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


basicExampleViewGridLayout : List (Element Styles variation msg)
basicExampleViewGridLayout =
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


basicExampleViewNamedGridLayout : List (Element Styles variation msg)
basicExampleViewNamedGridLayout =
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
