module BGSearchApp exposing (init, main)

import Browser
import Types exposing (Model, SomethingHappened(..))
import Update exposing (update)
import View exposing (view)



-- MAIN


main =
    Browser.element { init = init, subscriptions = \a -> Sub.none, update = update, view = view }


init : () -> ( Model, Cmd msg )
init _ =
    ( { gameSearchResults = [], gameSearchInput = "", errorMsg = "" }, Cmd.none )
