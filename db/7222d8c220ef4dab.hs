-- tGrains ; mouse control ; requires=buf
let b = control kr "buf" 100
    tRate = mouseY kr 2 200 Exponential 0.1
    ctr = mouseX kr 0 (bufDur kr b) Linear 0.1
    tr = impulse ar tRate 0
in tGrains 2 tr b 1 ctr (4 / tRate) 0 0.25 2
