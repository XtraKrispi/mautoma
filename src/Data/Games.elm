module Data.Games exposing (..)

import Model exposing (Game(..), GameMeta)


allGames : List GameMeta
allGames =
    [ rajasOfTheGanges ]


rajasOfTheGanges : GameMeta
rajasOfTheGanges =
    { game = RajasOfTheGanges
    , slug = "rajas-of-the-ganges"
    , gameName = "Rajas of the Ganges"
    , gameDescription = "Manage your dice to build profitable markets and grand monuments in historic India."
    , bggId = "220877"
    , coverImage = "./rajas/rajas-of-the-ganges.webp"
    }
