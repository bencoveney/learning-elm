module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { counter : Int
    , content : String
    }


init : Model
init =
    { counter = 0
    , content = ""
    }



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Reset
    | Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }

        Decrement ->
            { model | counter = model.counter - 1 }

        Reset ->
            { model | counter = 0 }

        Change newContent ->
            { model | content = newContent }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "0" ]
        , div [] [ text (String.fromInt model.counter) ]
        , input [ placeholder "Flip-reverse it", value model.content, onInput Change ] []
        , div [] [ text (String.reverse model.content) ]
        ]
