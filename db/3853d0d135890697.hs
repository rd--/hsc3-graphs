-- grainsin ; mouse control
let overlap = mouseY kr 0 2 Linear 0.2
    f = mouseX kr 1 220 Linear 0.2
in grainSin 2 (impulse ar f 0) (overlap / f) 440 0 (-1) 512 * 0.1
