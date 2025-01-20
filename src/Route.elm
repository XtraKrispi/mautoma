module Route exposing (..)

import Data.Games exposing (allGames)
import Model exposing (GameMeta)
import Url.Parser exposing (Parser, custom, map, oneOf, top)
import Utils.List as List


type Route
    = Home
    | Game GameMeta


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Home top
        , map Game gameParser
        ]


gameParser : Parser (GameMeta -> a) a
gameParser =
    custom "GAMEMETA" (\s -> List.find (\g -> g.slug == s) allGames)
