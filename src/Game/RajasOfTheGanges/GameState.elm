module Game.RajasOfTheGanges.GameState exposing (..)

import Random exposing (Generator)
import Random.List as Random


type alias BackDescription =
    { buildingActionDescription : String
    , marketActionDescription : String
    , riverActionDescription : String
    , palaceActionDescription : String
    , balconiesActionDescription : String
    }


type alias Adjustment =
    { fameAdjustment : Int
    , moneyAdjustment : Int
    }


type alias AutomaCard =
    { identifier : Int
    , frontImage : String
    , backImage : String
    , automaAction : AutomaAction
    , easyAdjustment : Adjustment
    , mediumAdjustment : Adjustment
    , hardAdjustment : Adjustment
    , backDescription : BackDescription
    }


type alias GameState =
    { drawPile : List AutomaCard
    , discardPile : List AutomaCard
    , activeCard : Maybe AutomaCard
    , gameMode : GameMode
    , difficulty : Difficulty
    , automaFame : Int
    , automaMoney : Int
    }


type Difficulty
    = Easy
    | Medium
    | Hard


type AutomaAction
    = BuildingAction
    | MarketAction
    | RiverAction
    | PalaceAction
    | BalconiesAction


type GameMode
    = BasicGame
    | NavaratnaGame


type Market
    = Silk
    | Tea
    | Spices
    | Assorted


type Balcony
    = TakeOneGreenDie
    | TakeOneOrangeDie
    | TakeOnePurpleDie
    | TakeOneBlueDie
    | TwoPurpleForOneOrange
    | TwoBlueForOneGreen
    | TwoGreenForOnePurple
    | TwoOrangeForOneBlue


type PalaceRoom
    = GreatMogul
    | Dancer
    | Yogi
    | RajaManSingh
    | MasterBuilder ( Int, Int )
    | Portuguese


buildActionDescription : ( Int, Int ) -> String
buildActionDescription ( row, column ) =
    "Discard province at row "
        ++ String.fromInt row
        ++ ", column "
        ++ String.fromInt column
        ++ ". (Automa gains no fame for this)"


marketActionDescription : Market -> String
marketActionDescription market =
    let
        marketDescription =
            case market of
                Silk ->
                    "silk"

                Tea ->
                    "tea"

                Spices ->
                    "spices"

                Assorted ->
                    "assorted goods"
    in
    "Place an automa worker on the "
        ++ marketDescription
        ++ " market. (Automa gains no money for this)"


riverActionDescription : Int -> String
riverActionDescription num =
    "Advance automa's ship "
        ++ String.fromInt num
        ++ " spaces (Automa gains no bonus)"


balconiesActionDescription : Balcony -> String
balconiesActionDescription balcony =
    let
        balconyDescription =
            case balcony of
                TakeOneGreenDie ->
                    "\"take one green die\""

                TakeOneOrangeDie ->
                    "\"take one orange die\""

                TakeOneBlueDie ->
                    "\"take one blue die\""

                TakeOnePurpleDie ->
                    "\"take one purple die\""

                TwoPurpleForOneOrange ->
                    "\"two purple dice for one orange die\""

                TwoBlueForOneGreen ->
                    "\"two blue dice for one green die\""

                TwoGreenForOnePurple ->
                    "\"two green dice for one purple die\""

                TwoOrangeForOneBlue ->
                    "\"two orange dice for one blue die\""
    in
    "Place an automa worker on the " ++ balconyDescription ++ " space."


palaceActionDescription : PalaceRoom -> String
palaceActionDescription room =
    let
        ( roomDescription, extraAction ) =
            case room of
                GreatMogul ->
                    ( "Great Mogul", Nothing )

                Dancer ->
                    ( "Dancer", Nothing )

                Yogi ->
                    ( "Yogi", Nothing )

                RajaManSingh ->
                    ( "Raja Man Singh", Nothing )

                MasterBuilder province ->
                    ( "Master Builder", Just (buildActionDescription province) )

                Portuguese ->
                    ( "Portuguese", Just "Advance the automa ship 6 spaces" )
    in
    "Place an automa worker on the " ++ roomDescription ++ " space. " ++ Maybe.withDefault "" extraAction


initialGameState : List AutomaCard -> GameState
initialGameState automaCards =
    { drawPile = automaCards
    , discardPile = []
    , activeCard = Nothing
    , gameMode = BasicGame
    , difficulty = Easy
    , automaFame = 0
    , automaMoney = 0
    }


gameStateGenerator : List AutomaCard -> Generator GameState
gameStateGenerator automaCards =
    automaCards
        |> Random.shuffle
        |> Random.map
            (\c ->
                let
                    initialState =
                        initialGameState automaCards
                in
                { initialState | drawPile = c }
            )


gameStateShuffleDiscard : GameState -> Generator GameState
gameStateShuffleDiscard gameState =
    (gameState.discardPile ++ gameState.drawPile)
        |> Random.shuffle
        |> Random.map
            (\discards ->
                { gameState
                    | drawPile = discards
                    , discardPile = []
                }
            )


updateAutomaScore : GameState -> GameState
updateAutomaScore gameState =
    case gameState.activeCard of
        Just card ->
            let
                { fameAdjustment, moneyAdjustment } =
                    case gameState.difficulty of
                        Easy ->
                            card.easyAdjustment

                        Medium ->
                            card.mediumAdjustment

                        Hard ->
                            card.hardAdjustment
            in
            { gameState
                | automaFame = gameState.automaFame + fameAdjustment
                , automaMoney = gameState.automaMoney + moneyAdjustment
            }

        Nothing ->
            gameState


extractDescription : AutomaAction -> AutomaCard -> String
extractDescription action card =
    case action of
        BuildingAction ->
            card.backDescription.buildingActionDescription

        MarketAction ->
            card.backDescription.marketActionDescription

        RiverAction ->
            card.backDescription.riverActionDescription

        PalaceAction ->
            card.backDescription.palaceActionDescription

        BalconiesAction ->
            card.backDescription.balconiesActionDescription
