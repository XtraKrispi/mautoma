module Model exposing (..)


type Game
    = RajasOfTheGanges


type alias GameMeta =
    { game : Game
    , slug : String
    , gameName : String
    , gameDescription : String
    , bggId : String
    , coverImage : String
    }


type GameState
    = RajasOfTheGangesGameState
