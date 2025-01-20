module Game.RajasOfTheGanges.Page exposing (..)

import Game.RajasOfTheGanges.Data.Cards exposing (automaCards)
import Game.RajasOfTheGanges.GameState
    exposing
        ( AutomaCard
        , Difficulty
        , GameMode(..)
        , GameState
        , extractDescription
        , gameStateGenerator
        , gameStateShuffleDiscard
        , initialGameState
        , updateAutomaScore
        )
import Html exposing (Html)
import Html.Attributes
    exposing
        ( checked
        , class
        , src
        , type_
        )
import Html.Events exposing (onCheck, onClick)
import Random exposing (generate)


type alias Model =
    { gameState : GameState
    , setupOpen : Bool
    , gamePlayOpen : Bool
    }


type Msg
    = SelectGameMode GameMode
    | SelectGameDifficulty Difficulty
    | Randomized GameState
    | DrawCard
    | SetSetup Bool
    | SetGamePlay Bool
    | EndRound


init : Maybe GameState -> ( Model, Cmd Msg )
init _ =
    ( { gameState = initialGameState automaCards
      , setupOpen = False
      , gamePlayOpen = True
      }
    , generate Randomized (gameStateGenerator automaCards)
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SelectGameMode mode ->
            let
                newGameState =
                    model.gameState |> (\gs -> { gs | gameMode = mode })
            in
            ( { model | gameState = newGameState }, Cmd.none )

        SelectGameDifficulty difficulty ->
            let
                newGameState =
                    model.gameState
                        |> (\gs -> { gs | difficulty = difficulty })
            in
            ( { model | gameState = newGameState }, Cmd.none )

        Randomized gameState ->
            ( { model | gameState = gameState }, Cmd.none )

        DrawCard ->
            let
                gameState =
                    model.gameState

                discardPile =
                    model.gameState.activeCard
                        |> Maybe.map (\ac -> ac :: model.gameState.discardPile)
                        |> Maybe.withDefault model.gameState.discardPile

                ( newGameState, cmd ) =
                    case model.gameState.drawPile of
                        x :: y :: xs ->
                            ( { gameState
                                | drawPile = y :: xs
                                , activeCard = Just x
                                , discardPile = discardPile
                              }
                            , Cmd.none
                            )

                        _ ->
                            ( { gameState | discardPile = discardPile }
                            , generate Randomized (gameStateShuffleDiscard gameState)
                            )
            in
            ( { model | gameState = newGameState }, cmd )

        SetSetup isOpen ->
            ( { model | setupOpen = isOpen }, Cmd.none )

        SetGamePlay isOpen ->
            ( { model | gamePlayOpen = isOpen }, Cmd.none )

        EndRound ->
            ( { model | gameState = updateAutomaScore model.gameState }
            , Cmd.none
            )


view : Model -> Html Msg
view model =
    Html.div []
        [ Html.div [ class "flex justify-center" ]
            [ Html.img
                [ class "opacity-20 absolute"
                , src "ASSET_URL:../static/rajas/rajas-of-the-ganges.webp"
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
                        [ gamePlay model
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
                    "Game Mode: "
                ]
            , Html.input
                [ type_ "checkbox"
                , class "toggle"
                , checked (model.gameState.gameMode == NavaratnaGame)
                , onCheck
                    (\isChecked ->
                        if isChecked then
                            SelectGameMode NavaratnaGame

                        else
                            SelectGameMode BasicGame
                    )
                ]
                []
            , Html.span []
                [ Html.text
                    (if model.gameState.gameMode == NavaratnaGame then
                        "Navaratna"

                     else
                        "Basic"
                    )
                ]
            ]
        , Html.p [ class "flex space-x-4 items-center" ]
            [ Html.span [] [ Html.text "Difficulty:" ]
            , Html.select [ class "select w-full max-w-xs" ]
                [ Html.option [] [ Html.text "Easy" ]
                , Html.option [] [ Html.text "Medium" ]
                , Html.option [] [ Html.text "Hard" ]
                ]
            ]
        , Html.p [ class "flex flex-col space-y-2" ]
            [ Html.p []
                [ Html.span []
                    [ Html.text "Prepare a standard set-up for two players, but consider that the Automa doesn't need all the components, so you can leave the following components in the box:"
                    ]
                , Html.ul [ class "ml-8 list-disc" ]
                    ([ Html.li []
                        [ Html.text "The province board"
                        ]
                     , Html.li []
                        [ Html.text "The four markers for palaces upgrade"
                        ]
                     , Html.li []
                        [ Html.text "The marker for karma points"
                        ]
                     , Html.li []
                        [ Html.text "The personal dice and the Kali statue"
                        ]
                     ]
                        ++ (if model.gameState.gameMode == NavaratnaGame then
                                [ Html.li []
                                    [ Html.text "Select one brown yield tile for yourself then remove 2 yield tiles per color"
                                    ]
                                ]

                            else
                                []
                           )
                    )
                ]
            , Html.span []
                [ Html.text "Randomly select a first player"
                ]
            , Html.div []
                [ Html.span [] [ Html.text "Arrange the province tiles in a 3x4 grid like this:" ]
                , Html.div [ class "mt-2 ml-2" ]
                    [ Html.img
                        [ src "ASSET_URL:../static/rajas/province-tile.png"
                        , class "w-8 h-8"
                        ]
                        []
                        |> List.repeat 12
                        |> Html.div [ class "grid grid-cols-4 gap-4 w-[176px]" ]
                    ]
                ]
            ]
        ]


gamePlay : Model -> Html Msg
gamePlay model =
    Html.div [ class "flex flex-col space-y-4" ]
        [ Html.div [ class "text-xl font-bold flex flex-col space-y-2" ]
            [ Html.h2 [] [ Html.text "Automa Score: " ]
            , Html.h2 [] [ Html.text ("Fame: " ++ String.fromInt model.gameState.automaFame) ]
            , Html.h2 [] [ Html.text ("Money: " ++ String.fromInt model.gameState.automaMoney) ]
            ]
        , Html.div [ class "flex flex-col space-y-4 items-center" ]
            [ Html.div [ class "flex justify-between w-full space-x-4" ]
                [ Html.div [ class "flex flex-col space-y-4" ]
                    [ currentCard model model.gameState.activeCard
                    , Html.button
                        [ class "w-full btn btn-primary"
                        , onClick DrawCard
                        ]
                        [ Html.text "Draw a Card" ]
                    ]
                , Html.div [ class "flex flex-col space-y-4" ]
                    [ deck model.gameState.drawPile
                    , Html.button
                        [ class "w-full btn btn-secondary"
                        , onClick EndRound
                        ]
                        [ Html.text "End Round" ]
                    ]
                ]
            , Html.div [ class "prose" ]
                [ Html.h3 []
                    [ cardDescription model.gameState
                    ]
                ]
            ]
        ]


cardDescription : GameState -> Html msg
cardDescription { activeCard, drawPile } =
    case ( activeCard, drawPile ) of
        ( Just card, x :: _ ) ->
            Html.text (extractDescription card.automaAction x)

        _ ->
            Html.text ""


deck : List AutomaCard -> Html Msg
deck d =
    case d of
        [] ->
            Html.div [] []

        x :: _ ->
            Html.div [ class "w-full" ] [ Html.img [ src x.backImage ] [] ]


currentCard : Model -> Maybe AutomaCard -> Html Msg
currentCard _ card =
    case card of
        Nothing ->
            Html.div [ class "w-full border border-1 border-dotted rounded-lg" ]
                [ Html.img [ class "opacity-0", src "ASSET_URL:../static/rajas/cards/card-1-front.png" ] []
                ]

        Just c ->
            Html.div [ class "w-full" ]
                [ Html.img
                    [ src c.frontImage
                    ]
                    []
                ]
