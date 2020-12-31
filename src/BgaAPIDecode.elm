module BgaAPIDecode exposing (topLevelDecoder)

import Json.Decode as D exposing (Decoder, float, int, list, string)
import Json.Decode.Pipeline as D exposing (optional)
import Types exposing (Game)


gameDecoder : Decoder Game
gameDecoder =
    D.succeed Game
        |> D.required "name" string
        |> D.optional "average_user_rating" (D.maybe float) Nothing
        |> D.optional "year_published" (D.maybe int) Nothing
        |> D.optional "url" (D.maybe string) Nothing
        |> D.optionalAt [ "images", "small" ] (D.maybe string) Nothing


listOfGamesDecoder : Decoder (List Game)
listOfGamesDecoder =
    D.list gameDecoder


topLevelDecoder : Decoder (List Game)
topLevelDecoder =
    D.field "games" listOfGamesDecoder
