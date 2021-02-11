module List1 exposing (..)

import Element exposing (Element, alignRight, column, el, fill, fillPortion, height, inFront, layout, padding, paragraph, px, rgb, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html, a)


xs : List String
xs =
    [ "a Hello", "b Bellow", "c Challo" ]


themeBackgroundColor : Element.Color
themeBackgroundColor =
    rgb255 29 29 29


redColor : Element.Color
redColor =
    rgb255 255 35 35


whiteColor : Element.Color
whiteColor =
    rgb255 245 245 245


greenColor : Element.Color
greenColor =
    rgb255 35 255 35


metroBlueColor : Element.Color
metroBlueColor =
    rgb255 27 161 226


electricVioletColor : Element.Color
electricVioletColor =
    rgb255 106 0 255


blazeOrangeColor : Element.Color
blazeOrangeColor =
    rgb255 250 104 0


main : Html msg
main =
    layout
        [ Background.color <|
            themeBackgroundColor
        , width fill
        , height fill
        , padding 40
        ]
    <|
        column [ width fill, height fill, spacing 20 ]
            [ viewMenu
            , viewGrid
            ]


viewMenu : Element msg
viewMenu =
    row
        [ height <| fillPortion 1
        , width fill
        , padding 5
        , spacing 20
        ]
    <|
        [ viewLogo
        ]


viewLogo : Element msg
viewLogo =
    paragraph
        [ Font.size 50
        , Font.extraLight
        , Font.color <| rgb255 255 255 255
        , Font.family
            [ Font.external
                { name = "Metrophobic"
                , url = "https://fonts.googleapis.com/css?family=Metrophobic"
                }
            , Font.sansSerif
            ]
        ]
        [ text "Start"
        ]


viewGrid : Element msg
viewGrid =
    row
        [ width fill
        , height <| fillPortion 16
        , spacing 80
        ]
        [ viewGridCol "General"
        , viewGridCol "Images"
        , viewGridCol "Office"
        , viewGridCol "Games"
        ]


viewGridCol : String -> Element msg
viewGridCol titleText =
    column
        [ width <| fillPortion 5
        , height fill
        , spacing 10
        ]
        [ row [ height <| fillPortion 1, padding 10, Font.color whiteColor ] [ text titleText ]
        , viewMetroCell [ electricVioletColor, metroBlueColor ]
        , viewMetroCell [ blazeOrangeColor ]
        , viewMetroCell [ electricVioletColor, metroBlueColor ]
        ]


viewMetroCell : List Element.Color -> Element msg
viewMetroCell cellBgColors =
    row
        [ height <| fillPortion 9
        , width fill
        , spacing 10
        ]
    <|
        List.map
            (\bgColor ->
                column [ width <| fillPortion 2, height fill, Background.color bgColor ] []
            )
            cellBgColors
