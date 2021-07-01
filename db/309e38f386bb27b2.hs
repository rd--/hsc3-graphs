-- tGrains ; mouse control ; requires=buf
let b = control kr "buf" 0
    rt = mouseY kr 2 120 Exponential 0.1
    dur = 1.2 / rt
    clk = impulse ar rt 0
    pos = mouseX kr 0 (bufDur kr b) Linear 0.1
    n0 = whiteNoiseId 'α' kr
    n1 = whiteNoiseId 'β' kr
    rate = shiftLeft 1.2 (roundTo (n0 * 3) 1)
in tGrains 2 clk b rate pos dur (n1 * 0.6) 0.25 2
