import { Elm } from "./src/Main.elm";

const app = Elm.Main.init({
    node: document.getElementById("root"),
    flags: {
        gameData: (window.localStorage.getItem("game-data") && JSON.parse(window.localStorage.getItem("game-data"))) || null
    }
});

if (app.ports) {
    if (app.ports.saveToLocalStorage) {
        app.ports.saveToLocalStorage.subscribe((data) => {
            window.localStorage.setItem("game-data", JSON.stringify(data));
        });
    }
}