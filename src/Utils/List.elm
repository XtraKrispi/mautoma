module Utils.List exposing (..)


find : (a -> Bool) -> List a -> Maybe a
find predicate =
    List.filter predicate >> List.head
