-- henonN ; with mouse-control of parameters
let x = mouseX KR 1 1.4 Linear 0.1
    y = mouseY KR 0 0.3 Linear 0.1
in henonN AR (sampleRate / 4) x y 0 0 * 0.1
