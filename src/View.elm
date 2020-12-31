module View exposing (view)

import Html exposing (Html, button, div, h2, img, input, span, text)
import Html.Attributes exposing (src, style, value)
import Html.Events exposing (onClick, onInput)
import String exposing (fromFloat, fromInt)
import Types exposing (Game, Model, SomethingHappened(..))



--advantages - html is managed by the compiler - all html elements are just functions and thus can be composed like anything else


view : Model -> Html SomethingHappened
view model =
    div []
        [ input [ onInput UserTypedSomething, value model.gameSearchInput ] []
        , button [ onClick UserClickedSearch ] [ text "search" ]
        , div [ style "color" "red" ] [ text model.errorMsg ]
        , div [] (List.map renderGameDiv model.gameSearchResults)
        ]


renderGameDiv : Game -> Html SomethingHappened
renderGameDiv game =
    div [ style "padding-bottom" "1em" ]
        [ div []
            [ h2 [] [ text game.name ] ]
        , div []
            [ span [ style "font-weight" "bold" ] [ text "Url " ]
            , span [] [ text (Maybe.withDefault "no url listed" game.url) ]
            ]
        , div []
            [ span [ style "font-weight" "bold" ] [ text "Published Year " ]
            , span [] [ text (game.yearPublished |> Maybe.map String.fromInt |> Maybe.withDefault "no published year listed") ]
            ]
        , div []
            [ span [ style "font-weight" "bold" ] [ text "Average User Rating " ]
            , span [] [ text (game.rating |> Maybe.map String.fromFloat |> Maybe.withDefault "no rating listed") ]
            ]
        , div []
            [ renderThumbDiv game.thumb_url ]
        ]


renderThumbDiv : Maybe String -> Html msg
renderThumbDiv maybeThumb =
    case maybeThumb of
        Just thumb ->
            img [ src thumb ] []

        Nothing ->
            span [] []
