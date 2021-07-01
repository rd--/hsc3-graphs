-- henonN ; with mouse-control of parameters
let x = mouseX kr 1 1.4 Linear 0.1
    y = mouseY kr 0 0.3 Linear 0.1
in henonN ar (sampleRate / 4) x y 0 0 * 0.1
