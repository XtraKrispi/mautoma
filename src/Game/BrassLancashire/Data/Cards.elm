module Game.BrassLancashire.Data.Cards exposing (..)

import Game.BrassLancashire.GameState exposing (AutomaCard, Era(..), Group(..), Map(..))


automaCards : List AutomaCard
automaCards =
    [ { cardNumber = 1
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-1-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-1-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 2
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-2-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-2-back.png"
      , era = AllEras
      , map = Nothing
      , group = C
      }
    , { cardNumber = 3
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-3-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-3-back.png"
      , era = RailEra
      , map = Nothing
      , group = C
      }
    , { cardNumber = 4
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-4-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-4-back.png"
      , era = AllEras
      , map = Nothing
      , group = C
      }
    , { cardNumber = 5
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-5-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-5-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = A
      }
    , { cardNumber = 6
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-6-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-6-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = A
      }
    , { cardNumber = 7
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-7-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-7-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 8
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-8-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-8-back.png"
      , era = AllEras
      , map = Nothing
      , group = A
      }
    , { cardNumber = 9
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-9-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-9-back.png"
      , era = AllEras
      , map = Nothing
      , group = A
      }
    , { cardNumber = 10
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-10-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-10-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 11
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-11-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-11-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = C
      }
    , { cardNumber = 12
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-12-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-12-back.png"
      , era = AllEras
      , map = Nothing
      , group = C
      }
    , { cardNumber = 13
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-13-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-13-back.png"
      , era = AllEras
      , map = Nothing
      , group = B
      }
    , { cardNumber = 14
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-14-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-14-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = B
      }
    , { cardNumber = 15
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-15-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-15-back.png"
      , era = AllEras
      , map = Nothing
      , group = B
      }
    , { cardNumber = 16
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-16-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-16-back.png"
      , era = AllEras
      , map = Nothing
      , group = C
      }
    , { cardNumber = 17
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-17-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-17-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = C
      }
    , { cardNumber = 18
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-18-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-18-back.png"
      , era = AllEras
      , map = Nothing
      , group = C
      }
    , { cardNumber = 19
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-19-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-19-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 20
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-20-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-20-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = C
      }
    , { cardNumber = 21
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-21-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-21-back.png"
      , era = RailEra
      , map = Nothing
      , group = A
      }
    , { cardNumber = 22
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-22-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-22-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = A
      }
    , { cardNumber = 23
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-23-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-23-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = A
      }
    , { cardNumber = 24
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-24-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-24-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = A
      }
    , { cardNumber = 25
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-25-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-25-back.png"
      , era = AllEras
      , map = Just SmallMap
      , group = A
      }
    , { cardNumber = 26
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-26-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-26-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = A
      }
    , { cardNumber = 27
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-27-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-27-back.png"
      , era = AllEras
      , map = Just SmallMap
      , group = A
      }
    , { cardNumber = 28
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-28-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-28-back.png"
      , era = AllEras
      , map = Nothing
      , group = A
      }
    , { cardNumber = 29
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-29-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-29-back.png"
      , era = AllEras
      , map = Just SmallMap
      , group = A
      }
    , { cardNumber = 30
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-30-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-30-back.png"
      , era = AllEras
      , map = Nothing
      , group = A
      }
    , { cardNumber = 31
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-31-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-31-back.png"
      , era = RailEra
      , map = Nothing
      , group = B
      }
    , { cardNumber = 32
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-32-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-32-back.png"
      , era = AllEras
      , map = Just SmallMap
      , group = B
      }
    , { cardNumber = 33
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-33-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-33-back.png"
      , era = RailEra
      , map = Just SmallMap
      , group = B
      }
    , { cardNumber = 34
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-34-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-34-back.png"
      , era = AllEras
      , map = Nothing
      , group = B
      }
    , { cardNumber = 35
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-35-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-35-back.png"
      , era = RailEra
      , map = Nothing
      , group = C
      }
    , { cardNumber = 36
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-36-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-36-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = B
      }
    , { cardNumber = 37
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-37-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-37-back.png"
      , era = AllEras
      , map = Nothing
      , group = B
      }
    , { cardNumber = 38
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-38-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-38-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 39
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-39-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-39-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = B
      }
    , { cardNumber = 40
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-40-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-40-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = C
      }
    , { cardNumber = 41
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-41-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-41-back.png"
      , era = RailEra
      , map = Just LargeMap
      , group = A
      }
    , { cardNumber = 42
      , frontImage = "ASSET_URL:../static/brass-lancashire/cards/card-42-front.png"
      , backImage = "ASSET_URL:../static/brass-lancashire/cards/card-42-back.png"
      , era = AllEras
      , map = Just LargeMap
      , group = C
      }
    ]
