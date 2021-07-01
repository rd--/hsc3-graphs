-- latch ; http://create.ucsb.edu/pipermail/sc-users/2006-December/029991.html
let n0 = lfNoise2Id 'α' kr 8
    n1 = lfNoise2Id 'β' kr 3
    s = blip ar (n0 * 200 + 300) (n1 * 10 + 20)
    x = mouseX kr 1000 (sampleRate * 0.1) Exponential 0.1
in latch s (impulse ar x 0)
