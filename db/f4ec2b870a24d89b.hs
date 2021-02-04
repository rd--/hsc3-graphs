-- grainBuf ; requires=buf ; mouse control
let b = control KR "buf" 0
    e = -1
    x = mouseX KR (-1) 1 Linear 0.1
    y = mouseY KR 10 45 Linear 0.1
    i = impulse KR y 0
    r = linLin (lfNoise1 'α' KR 500) (-1) 1 0.5 2
    p = linLin (lfNoise2 'β' KR 0.1) (-1) 1 0 1
in grainBuf 2 i 0.1 b r p 2 x e 512 * control KR "gain" 0.25
