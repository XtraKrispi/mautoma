module Game.RajasOfTheGanges.Data.Cards exposing (..)

import Game.RajasOfTheGanges.GameState exposing (AutomaAction(..), AutomaCard, Balcony(..), Market(..), PalaceRoom(..), balconiesActionDescription, buildActionDescription, marketActionDescription, palaceActionDescription, riverActionDescription)


automaCards : List AutomaCard
automaCards =
    [ { identifier = 1
      , frontImage = "./rajas/cards/card-1-front.png"
      , backImage = "./rajas/cards/card-1-back.png"
      , automaAction = RiverAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 4, 3 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 2
            , palaceActionDescription = palaceActionDescription RajaManSingh
            , balconiesActionDescription = balconiesActionDescription TakeOneGreenDie
            }
      }
    , { identifier = 2
      , frontImage = "rajas/cards/card-2-front.png"
      , backImage = "rajas/cards/card-2-back.png"
      , automaAction = BuildingAction
      , easyAdjustment = { fameAdjustment = 3, moneyAdjustment = 7 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 2, 2 )
            , marketActionDescription = marketActionDescription Tea
            , riverActionDescription = riverActionDescription 3
            , palaceActionDescription = palaceActionDescription RajaManSingh
            , balconiesActionDescription = balconiesActionDescription TwoPurpleForOneOrange
            }
      }
    , { identifier = 3
      , frontImage = "rajas/cards/card-3-front.png"
      , backImage = "rajas/cards/card-3-back.png"
      , automaAction = BuildingAction
      , easyAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 1, 1 )
            , marketActionDescription = marketActionDescription Silk
            , riverActionDescription = riverActionDescription 1
            , palaceActionDescription = palaceActionDescription Portuguese
            , balconiesActionDescription = balconiesActionDescription TwoPurpleForOneOrange
            }
      }
    , { identifier = 4
      , frontImage = "rajas/cards/card-4-front.png"
      , backImage = "rajas/cards/card-4-back.png"
      , automaAction = PalaceAction
      , easyAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , mediumAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 6, moneyAdjustment = 7 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 3, 3 )
            , marketActionDescription = marketActionDescription Silk
            , riverActionDescription = riverActionDescription 2
            , palaceActionDescription = palaceActionDescription Portuguese
            , balconiesActionDescription = balconiesActionDescription TwoBlueForOneGreen
            }
      }
    , { identifier = 5
      , frontImage = "rajas/cards/card-5-front.png"
      , backImage = "rajas/cards/card-5-back.png"
      , automaAction = BalconiesAction
      , easyAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 8 }
      , hardAdjustment = { fameAdjustment = 4, moneyAdjustment = 8 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 2, 4 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 3
            , palaceActionDescription = palaceActionDescription Dancer
            , balconiesActionDescription = balconiesActionDescription TakeOneBlueDie
            }
      }
    , { identifier = 6
      , frontImage = "rajas/cards/card-6-front.png"
      , backImage = "rajas/cards/card-6-back.png"
      , automaAction = MarketAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , mediumAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , hardAdjustment = { fameAdjustment = 4, moneyAdjustment = 9 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 3, 1 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 2
            , palaceActionDescription = palaceActionDescription Dancer
            , balconiesActionDescription = balconiesActionDescription TwoGreenForOnePurple
            }
      }
    , { identifier = 7
      , frontImage = "rajas/cards/card-7-front.png"
      , backImage = "rajas/cards/card-7-back.png"
      , automaAction = MarketAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 8 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 4, moneyAdjustment = 9 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 2, 1 )
            , marketActionDescription = marketActionDescription Spices
            , riverActionDescription = riverActionDescription 3
            , palaceActionDescription = palaceActionDescription Yogi
            , balconiesActionDescription = balconiesActionDescription TwoGreenForOnePurple
            }
      }
    , { identifier = 8
      , frontImage = "rajas/cards/card-8-front.png"
      , backImage = "rajas/cards/card-8-back.png"
      , automaAction = PalaceAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 6 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 8 }
      , hardAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 2, 3 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 3
            , palaceActionDescription = palaceActionDescription GreatMogul
            , balconiesActionDescription = balconiesActionDescription TakeOneOrangeDie
            }
      }
    , { identifier = 9
      , frontImage = "rajas/cards/card-9-front.png"
      , backImage = "rajas/cards/card-9-back.png"
      , automaAction = BuildingAction
      , easyAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , mediumAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 5, moneyAdjustment = 9 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 3, 2 )
            , marketActionDescription = marketActionDescription Spices
            , riverActionDescription = riverActionDescription 2
            , palaceActionDescription = palaceActionDescription Yogi
            , balconiesActionDescription = balconiesActionDescription TwoOrangeForOneBlue
            }
      }
    , { identifier = 10
      , frontImage = "rajas/cards/card-10-front.png"
      , backImage = "rajas/cards/card-10-back.png"
      , automaAction = RiverAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 6 }
      , mediumAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 6, moneyAdjustment = 8 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 1, 4 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 1
            , palaceActionDescription = palaceActionDescription (MasterBuilder ( 1, 4 ))
            , balconiesActionDescription = balconiesActionDescription TakeOnePurpleDie
            }
      }
    , { identifier = 11
      , frontImage = "rajas/cards/card-11-front.png"
      , backImage = "rajas/cards/card-11-back.png"
      , automaAction = MarketAction
      , easyAdjustment = { fameAdjustment = 4, moneyAdjustment = 6 }
      , mediumAdjustment = { fameAdjustment = 5, moneyAdjustment = 8 }
      , hardAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 1, 3 )
            , marketActionDescription = marketActionDescription Tea
            , riverActionDescription = riverActionDescription 1
            , palaceActionDescription = palaceActionDescription RajaManSingh
            , balconiesActionDescription = balconiesActionDescription TwoBlueForOneGreen
            }
      }
    , { identifier = 12
      , frontImage = "rajas/cards/card-12-front.png"
      , backImage = "rajas/cards/card-12-back.png"
      , automaAction = BuildingAction
      , easyAdjustment = { fameAdjustment = 3, moneyAdjustment = 8 }
      , mediumAdjustment = { fameAdjustment = 5, moneyAdjustment = 7 }
      , hardAdjustment = { fameAdjustment = 4, moneyAdjustment = 7 }
      , backDescription =
            { buildingActionDescription = buildActionDescription ( 1, 2 )
            , marketActionDescription = marketActionDescription Assorted
            , riverActionDescription = riverActionDescription 1
            , palaceActionDescription = palaceActionDescription Dancer
            , balconiesActionDescription = balconiesActionDescription TwoOrangeForOneBlue
            }
      }
    ]
