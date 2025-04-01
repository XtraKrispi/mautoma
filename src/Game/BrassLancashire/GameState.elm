module Game.BrassLancashire.GameState exposing (..)


type alias AutomaCard =
    { cardNumber : Int
    , frontImage : String
    , backImage : String
    , map : Maybe Map
    , era : EffectiveEra
    , group : Group
    }


type Map
    = LargeMap
    | SmallMap


type EffectiveEra
    = OnlyRailEra
    | AllEras


type Era
    = Rail
    | Canal


type alias GameState =
    { mapSelection : Map
    , difficulty : DifficultyLevel
    , currentDeck : List AutomaCard
    , activeCard : Maybe AutomaCard
    , discardPile : List AutomaCard
    , currentEra : Era
    }


type DifficultyLevel
    = Easy
    | Medium
    | Hard


type Group
    = A
    | B
    | C
