module BgaAPI exposing (searchBGA)

import BgaAPIDecode exposing (topLevelDecoder)
import Http
import Types exposing (SomethingHappened(..))


searchBGA : String -> Cmd SomethingHappened
searchBGA searchTerm =
    Http.request
        { method = "GET"
        , headers = []
        , url = "https://api.boardgameatlas.com/api/search?name=" ++ searchTerm ++ "&client_id=ZANeQz6FjG"
        , expect = Http.expectJson ReceivedResponseFromBGA topLevelDecoder
        , body = Http.stringBody "" ""
        , timeout = Nothing
        , tracker = Nothing
        }
