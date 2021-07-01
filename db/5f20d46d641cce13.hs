-- tBrownRand ; audio rate noise
let x = mouseX kr 500 5000 Exponential 0.2
    y = mouseY kr 10 500 Exponential 0.2
    t = dustId 'α' ar x
in lag (X.tBrownRandId 'β' (-1) 1 0.2 0 t) (y / 48000)
