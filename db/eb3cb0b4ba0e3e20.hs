-- grainSin ; mouse control
let n = whiteNoiseId 'α' kr
    x = mouseX kr (-0.5) 0.5 Linear 0.1
    y = mouseY kr 0 400 Linear 0.1
    f = n * y + 440
    t = impulse kr 10 0
in grainSin 2 t 0.1 f x (-1) 512 * 0.1
