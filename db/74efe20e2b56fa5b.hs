-- grainsin ; mouse control
let overlap = mouseY KR 0 2 Linear 0.2
    f = mouseX KR 1 220 Linear 0.2
in grainSin 2 (impulse AR f 0) (overlap / f) 440 0 (-1) 512 * 0.1
