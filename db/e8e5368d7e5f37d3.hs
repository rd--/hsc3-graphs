-- tGrains ; mouse control ; requires=buf
let b = control kr "buf" 0
    rt = mouseY kr 8 120 Exponential 0.1
    dur = 4 / rt
    clk = dustId 'α' ar rt
    r = tRandId 'β' 0 0.01 clk
    pan = whiteNoiseId 'γ' kr * 0.6
    x = mouseX kr 0 (bufDur kr b) Linear 0.1
    pos = x + r
in tGrains 2 clk b 1 pos dur pan 0.25 2
