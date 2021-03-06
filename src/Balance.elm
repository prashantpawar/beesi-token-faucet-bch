module Balance exposing (..)

import Browser
import Html exposing (Html, div, text)
import Http exposing (Error)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias ModelData =
    { message : String
    , blockcount : Maybe Int
    }


type Model
    = Success ModelData
    | Failure
    | Loading


init : flags -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , getBlockcount
    )



-- UPDATE


type Msg
    = GotResponse (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotResponse result ->
            case result of
                Ok fullResponse ->
                    ( Success { message = fullResponse, blockcount = Nothing }, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    case model of
        Failure ->
            div [] [ text "Failure" ]

        Loading ->
            div [] [ text "Loading..." ]

        Success modeldata ->
            div [] [ text modeldata.message ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- HTTP


getBlockcount : Cmd Msg
getBlockcount =
    Http.get
        { url = "https://api.fullstack.cash/v4/electrumx/balance/bitcoincash:qr69kyzha07dcecrsvjwsj4s6slnlq4r8c30lxnur3"
        , expect = Http.expectString GotResponse
        }


blockcountDecoders =
    ""
