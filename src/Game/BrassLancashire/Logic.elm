module Game.BrassLancashire.Logic exposing (..)

import Game.BrassLancashire.Data.Cards exposing (automaCards)
import Game.BrassLancashire.GameState exposing (AutomaCard, EffectiveEra(..), Era(..), Group(..), Map)
import Random exposing (Generator)
import Random.List


topXAndThen1 :
    Int
    -> List AutomaCard
    ->
        Generator
            { topX : List AutomaCard
            , nextSingle : List AutomaCard
            , restOfCards : List AutomaCard
            }
topXAndThen1 x cards =
    cards
        |> Random.List.shuffle
        |> Random.andThen
            (\cs ->
                cs
                    |> Random.List.choices x
                    |> Random.andThen
                        (\( topX, rest ) ->
                            rest
                                |> Random.List.choices 1
                                |> Random.map
                                    (\( top1, rest_ ) ->
                                        { topX = topX
                                        , nextSingle = top1
                                        , restOfCards = rest_
                                        }
                                    )
                        )
            )


setupEra : EffectiveEra -> Map -> Generator (List AutomaCard)
setupEra era map =
    let
        aCards =
            automaCards
                |> List.filter (\c -> c.era == era && c.group == A && (c.map == Nothing || c.map == Just map))

        bCards =
            automaCards
                |> List.filter (\c -> c.era == era && c.group == B && (c.map == Nothing || c.map == Just map))

        cCards =
            automaCards
                |> List.filter (\c -> c.era == era && c.group == C && (c.map == Nothing || c.map == Just map))
    in
    topXAndThen1 4 aCards
        |> Random.andThen
            (\a ->
                topXAndThen1 3 bCards
                    |> Random.andThen
                        (\b ->
                            topXAndThen1 3 cCards
                                |> Random.andThen
                                    (\c ->
                                        let
                                            rests =
                                                a.restOfCards ++ b.restOfCards ++ c.restOfCards

                                            singles =
                                                a.nextSingle ++ b.nextSingle ++ c.nextSingle

                                            tops =
                                                a.topX ++ b.topX ++ c.topX
                                        in
                                        Random.map3 (\rs ss ts -> rs ++ ss ++ ts)
                                            (Random.List.shuffle rests)
                                            (Random.List.shuffle singles)
                                            (Random.List.shuffle tops)
                                    )
                        )
            )


setupCanalEra : Map -> Generator (List AutomaCard)
setupCanalEra =
    setupEra AllEras


setupRailEra : Map -> Generator (List AutomaCard)
setupRailEra =
    setupEra OnlyRailEra
