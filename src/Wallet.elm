module Wallet exposing (..)

import Browser exposing (UrlRequest)
import Browser.Navigation
import Element exposing (..)
import Html exposing (Html)
import Url exposing (Url)


type alias Flags =
    {}


type alias ModelData =
    ()


type Model
    = UnInitialized
    | Loading
    | Initialized ModelData


initialModel : Model
initialModel =
    Loading


type Msg
    = NoOp
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


init : Flags -> Url.Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init _ _ _ =
    ( initialModel, Cmd.none )


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = urlChanged
        , onUrlRequest = \_ -> NoOp
        }


view : Model -> Browser.Document Msg
view model =
    case model of
        UnInitialized ->
            viewUninitialized

        Loading ->
            viewLoading

        Initialized modelData ->
            viewInitialized modelData


viewUninitialized : Browser.Document Msg
viewUninitialized =
    { title = "Uninitialized Wallet", body = [ layout [] (text "please initialize the wallet") ] }


viewLoading : Browser.Document Msg
viewLoading =
    { title = "Loading Char Sau Beesi App", body = [ layout [] (text "Loading...") ] }


viewInitialized : ModelData -> Browser.Document Msg
viewInitialized _ =
    { title = "Example"
    , body =
        [ layout
            []
            (text "Hello World!")
        ]
    }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    -- case Debug.log "msg" msg of
    case msg of
        NoOp ->
            ( model, Cmd.none )

        LinkClicked _ ->
            ( model, Cmd.none )

        UrlChanged _ ->
            ( model, Cmd.none )


urlChanged : Url -> Msg
urlChanged _ =
    NoOp
