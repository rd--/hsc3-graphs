-- moogFF ; note distortion at high gain
let x = mouseX kr 100 20000 Exponential 0.1
    y = mouseY kr 0.1 4.0 Linear 0.1
    i = mix (saw ar (mce [0.99, 1, 1.01] * 440)) * 0.2
in moogFF i x y 0
