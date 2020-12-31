--UPDATE
-- NOTE: would probably not use this file structure on a larger app.  Larger apps should be structured based on types.


module Update exposing (update)

import BgaAPI exposing (searchBGA)
import Types exposing (Model, SomethingHappened(..))


update : SomethingHappened -> Model -> ( Model, Cmd SomethingHappened )
update msg model =
    case msg of
        UserTypedSomething inputText ->
            ( { model | gameSearchInput = inputText }, Cmd.none )

        UserClickedSearch ->
            ( model
            , searchBGA model.gameSearchInput
            )

        ReceivedResponseFromBGA bgaResponse ->
            case bgaResponse of
                Ok gameList ->
                    ( { model | gameSearchResults = gameList }, Cmd.none )

                Err errMsg ->
                    ( { model | errorMsg = Debug.toString errMsg }, Cmd.none )
