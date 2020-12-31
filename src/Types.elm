module Types exposing (Game, Model, SomethingHappened(..), gameWithName)

import Http


type SomethingHappened
    = UserTypedSomething String
    | UserClickedSearch
    | ReceivedResponseFromBGA (Result Http.Error (List Game))


type alias Game =
    { name : String
    , rating : Maybe Float
    , yearPublished : Maybe Int
    , url : Maybe String
    , thumb_url : Maybe String
    }


gameWithName : String -> Game
gameWithName nm =
    { name = nm, rating = Nothing, yearPublished = Nothing, url = Nothing, thumb_url = Nothing }


type alias Model =
    { gameSearchResults : List Game
    , gameSearchInput : String
    , errorMsg : String
    }
