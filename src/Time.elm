module Time exposing (..)

-- elm-ui imports

import Browser
import Browser.Navigation
import Element exposing (Element, alignRight, centerY, el, fill, height, inFront, layout, padding, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import Main exposing (init, subscriptions, update)
import Random
import Url


main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        , onUrlChange = \_ -> NoOp
        , onUrlRequest = \_ -> NoOp
        }



-- MODEL


type alias Model =
    { dieFace : Int }



-- init : () -> ( Model, Cmd Msg )


init : () -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd msg )
init _ url key =
    ( Model 1
    , Cmd.none
    )



-- UPDATE


type Msg
    = Roll
    | NewFace Int
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Roll ->
            ( model, Random.generate NewFace (Random.int 1 6) )

        NewFace newFace ->
            ( Model newFace, Cmd.none )

        NoOp ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Time"
    , body = [ viewBody model ]
    }


viewBody : Model -> Html Msg
viewBody _ =
    layout [ width fill, height fill, inFront viewMenu ] <| el []


viewMenu : Model -> Html Msg
viewMenu _ =
    row [] []
