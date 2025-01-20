module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Data.Games exposing (allGames)
import Game.RajasOfTheGanges.Page as RajasOfTheGanges
import Html exposing (..)
import Html.Attributes exposing (href, src)
import Json.Encode
import Model exposing (Game(..))
import Route exposing (Route, routeParser)
import Url
import Url.Parser


main : Program { gameData : Json.Encode.Value } Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }


type Page
    = HomePage
    | RajasOfTheGangesPage RajasOfTheGanges.Model


type alias Model =
    { key : Nav.Key
    , route : Route
    , page : Page
    }


getRoute : Url.Url -> Route.Route
getRoute =
    Url.Parser.parse routeParser
        >> Maybe.withDefault Route.Home


getInitialPage : Route -> ( Page, Cmd Msg )
getInitialPage route =
    case route of
        Route.Home ->
            ( HomePage, Cmd.none )

        Route.Game gameMeta ->
            case gameMeta.game of
                RajasOfTheGanges ->
                    let
                        ( mdl, cmd ) =
                            RajasOfTheGanges.init Nothing
                    in
                    ( RajasOfTheGangesPage mdl, Cmd.map RajasOfTheGangesMsg cmd )


init :
    { gameData : Json.Encode.Value }
    -> Url.Url
    -> Nav.Key
    -> ( Model, Cmd Msg )
init _ url key =
    let
        route =
            getRoute url

        ( initialPage, initialPageCmd ) =
            getInitialPage route
    in
    ( Model key route initialPage, initialPageCmd )


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | RajasOfTheGangesMsg RajasOfTheGanges.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            let
                route =
                    getRoute url

                ( page, cmd ) =
                    getInitialPage route
            in
            ( { model | route = route, page = page }
            , cmd
            )

        RajasOfTheGangesMsg m ->
            case model.page of
                RajasOfTheGangesPage mdl ->
                    let
                        ( newModel, newCmd ) =
                            RajasOfTheGanges.update m mdl
                    in
                    ( { model | page = RajasOfTheGangesPage newModel }, Cmd.map RajasOfTheGangesMsg newCmd )

                _ ->
                    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


menu : Html Msg
menu =
    allGames
        |> List.map (\g -> a [ href g.slug ] [ img [ src g.coverImage ] [] ])
        |> div
            []


view : Model -> Browser.Document Msg
view model =
    { title = "Application Title"
    , body =
        [ div []
            [ case model.page of
                HomePage ->
                    div []
                        [ menu
                        ]

                RajasOfTheGangesPage mdl ->
                    Html.map RajasOfTheGangesMsg (RajasOfTheGanges.view mdl)
            ]
        ]
    }
