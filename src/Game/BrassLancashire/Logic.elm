module Game.BrassLancashire.Logic exposing (..)

import Game.BrassLancashire.Data.Cards exposing (automaCards)
import Game.BrassLancashire.GameState exposing (AutomaCard, Group(..), Map)
import Random exposing (Generator)


setupCanalEra : Map -> Generator (List AutomaCard)
setupCanalEra map =
    let
        groupACards =
            automaCards
                |> List.filter (\c -> c.group == A && (c.map == Nothing || c.map == Just map))

        groupBCards =
            automaCards
                |> List.filter (\c -> c.group == B && (c.map == Nothing || c.map == Just map))

        groupCCards =
            automaCards
                |> List.filter (\c -> c.group == C && (c.map == Nothing || c.map == Just map))
    in
    Debug.todo ""


setupRailEra : Map -> Generator (List AutomaCard)
setupRailEra map =
    Debug.todo ""
