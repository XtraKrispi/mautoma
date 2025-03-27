module Data.Games exposing (..)

import Model exposing (Game(..), GameMeta)


allGames : List GameMeta
allGames =
    [ rajasOfTheGanges, brassLancashire ]


rajasOfTheGanges : GameMeta
rajasOfTheGanges =
    { game = RajasOfTheGanges
    , slug = "rajas-of-the-ganges"
    , gameName = "Rajas of the Ganges"
    , gameDescription = "Manage your dice to build profitable markets and grand monuments in historic India."
    , bggId = "220877"
    , coverImage = "ASSET_URL:../static/rajas/rajas-of-the-ganges.webp"
    }


brassLancashire : GameMeta
brassLancashire =
    { game = BrassLancashire
    , slug = "brass-lancashire"
    , gameName = "Brass: Lancashire"
    , gameDescription = "Test your economic mettle as you build and network in the Industrial Revolution."
    , bggId = "28720"
    , coverImage = "ASSET_URL:../static/brass-lancashire/brass-lancashire.jpg"
    }
