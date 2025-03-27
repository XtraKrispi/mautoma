module Game.BrassLancashire.Page exposing (..)

import Game.BrassLancashire.GameState exposing (AutomaCard, DifficultyLevel(..), GameState, Map(..))
import Game.BrassLancashire.Logic exposing (setupCanalEra)
import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (onCheck, onClick)
import Model exposing (GameMeta)
import Random


type alias Model =
    { gameState : GameState
    , setupOpen : Bool
    , gamePlayOpen : Bool
    , gameMeta : GameMeta
    }


type Msg
    = SetSetup Bool
    | SetGamePlay Bool
    | SelectMap Map
    | ChangeDifficulty DifficultyLevel
    | CanalDeckSetup (List AutomaCard)


init : GameMeta -> Maybe GameState -> ( Model, Cmd Msg )
init meta _ =
    ( { gameState =
            { mapSelection = SmallMap
            , difficulty = Easy
            , canalDeck = []
            }
      , setupOpen = False
      , gamePlayOpen = True
      , gameMeta = meta
      }
    , Random.generate CanalDeckSetup (setupCanalEra SmallMap)
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetSetup open ->
            ( { model | setupOpen = open }, Cmd.none )

        SetGamePlay open ->
            ( { model | gamePlayOpen = open }, Cmd.none )

        SelectMap map ->
            let
                gs =
                    model.gameState
            in
            ( { model | gameState = { gs | mapSelection = map } }
            , Random.generate CanalDeckSetup (setupCanalEra map)
            )

        ChangeDifficulty diff ->
            let
                gs =
                    model.gameState
            in
            ( { model | gameState = { gs | difficulty = diff } }, Cmd.none )

        CanalDeckSetup cards ->
            let
                gs =
                    model.gameState
            in
            ( { model | gameState = { gs | canalDeck = cards } }, Cmd.none )


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.div [ class "flex justify-center" ]
            [ Html.img
                [ class "opacity-20 absolute"
                , src model.gameMeta.coverImage
                ]
                []
            ]
        , Html.div [ class "flex justify-center" ]
            [ Html.div [ class "join join-vertical w-full sm:w-1/2 bg-black" ]
                [ Html.div [ class "collapse collapse-arrow join-item border-base-300 border" ]
                    [ Html.input
                        [ type_ "checkbox"
                        , checked model.setupOpen
                        , onCheck SetSetup
                        ]
                        []
                    , Html.div [ class "collapse-title text-xl font-medium" ]
                        [ Html.text "Setup" ]
                    , Html.div [ class "collapse-content" ]
                        [ setupRules model ]
                    ]
                , Html.div [ class "collapse collapse-arrow join-item border-base-300 border" ]
                    [ Html.input
                        [ type_ "checkbox"
                        , checked model.gamePlayOpen
                        , onCheck SetGamePlay
                        ]
                        []
                    , Html.div [ class "collapse-title text-xl font-medium" ] [ Html.text "Game Play" ]
                    , Html.div [ class "collapse-content" ]
                        [ Html.text "Game Play"
                        ]
                    ]
                ]
            ]
        ]


setupRules : Model -> Html Msg
setupRules model =
    Html.div [ class "flex flex-col space-y-4" ]
        [ Html.p [ class "flex space-x-2" ]
            [ Html.span []
                [ Html.text
                    "Map: "
                ]
            , Html.input
                [ type_ "checkbox"
                , class "toggle"
                , checked (model.gameState.mapSelection == LargeMap)
                , onCheck
                    (\isChecked ->
                        if isChecked then
                            SelectMap LargeMap

                        else
                            SelectMap SmallMap
                    )
                ]
                []
            , Html.span []
                [ Html.text
                    (if model.gameState.mapSelection == SmallMap then
                        "Small Map"

                     else
                        "Large Map"
                    )
                ]
            ]
        , Html.div [ class "flex flex-col space-y-4" ]
            [ Html.p [ class "flex space-x-4 items-center" ]
                [ Html.span [] [ Html.text "Difficulty:" ]
                , Html.div [ class "tabs tabs-box" ]
                    [ Html.button
                        [ type_ "button"
                        , classList
                            [ ( "tab", True )
                            , ( "tab-active", model.gameState.difficulty == Easy )
                            ]
                        , onClick (ChangeDifficulty Easy)
                        ]
                        [ Html.text "Easy" ]
                    , Html.button
                        [ type_ "button"
                        , classList
                            [ ( "tab", True )
                            , ( "tab-active", model.gameState.difficulty == Medium )
                            ]
                        , onClick (ChangeDifficulty Medium)
                        ]
                        [ Html.text "Medium" ]
                    , Html.button
                        [ type_ "button"
                        , classList
                            [ ( "tab", True )
                            , ( "tab-active", model.gameState.difficulty == Hard )
                            ]
                        , onClick (ChangeDifficulty Hard)
                        ]
                        [ Html.text "Hard" ]
                    ]
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Set up for a two player game, with the following exceptions:" ]
                , Html.ul [ class "list-disc p-4" ]
                    [ Html.li [] [ Html.text "You don't need to give the Automa any money, or place it's income marker." ]
                    , Html.li []
                        [ Html.span [] [ Html.text "Set up the Automa player board as follows: " ]
                        , Html.img
                            [ class "w-64"
                            , src
                                (case model.gameState.difficulty of
                                    Easy ->
                                        "ASSET_URL:../static/brass-lancashire/setup-easy.png"

                                    Medium ->
                                        "ASSET_URL:../static/brass-lancashire/setup-medium.png"

                                    Hard ->
                                        "ASSET_URL:../static/brass-lancashire/setup-hard.png"
                                )
                            ]
                            []
                        ]
                    , Html.li []
                        [ Html.p []
                            [ Html.text
                                ("Select the 40 player cards corresponding to the "
                                    ++ (if model.gameState.mapSelection == LargeMap then
                                            "large"

                                        else
                                            "small"
                                       )
                                    ++ " map, and shuffle them.  Deal the first 19 cards into a deck.  Set the rest aside; they are not used in the Canal Era.  Note that the set-aside cards include the one card you'd remove from the deck at the start of a normal game, so you do not need to do that again."
                                )
                            ]
                        ]
                    ]
                ]
            ]
        ]
