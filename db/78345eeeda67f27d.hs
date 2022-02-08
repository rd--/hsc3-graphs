-- grainBuf ; requires=buf ; mouse control
let (buf, nc) = (control kr "buf" 0, 2)
    e = -1
    x = mouseX kr (-1) 1 Linear 0.1
    y = mouseY kr 10 45 Linear 0.1
    i = impulse kr y 0
    r = linLin (lfNoise1Id 'α' kr 500) (-1) 1 0.5 2
    p = linLin (lfNoise2Id 'β' kr 0.1) (-1) 1 0 1
in grainBuf 2 i 0.1 buf r p 2 x e 512 * control kr "gain" 0.25
