module Game.BrassLancashire.GameState exposing (..)


type alias AutomaCard =
    { cardNumber : Int
    , frontImage : String
    , backImage : String
    , map : Maybe Map
    , era : Era
    , group : Group
    }


type Map
    = LargeMap
    | SmallMap


type Era
    = RailEra
    | AllEras


type alias GameState =
    { mapSelection : Map
    , difficulty : DifficultyLevel
    , canalDeck : List AutomaCard
    }


type DifficultyLevel
    = Easy
    | Medium
    | Hard


type Group
    = A
    | B
    | C
