-- latch ; http://create.ucsb.edu/pipermail/sc-users/2006-December/029991.html
let n0 = lfNoise2 'α' KR 8
    n1 = lfNoise2 'β' KR 3
    s = blip AR (n0 * 200 + 300) (n1 * 10 + 20)
    x = mouseX KR 1000 (sampleRate * 0.1) Exponential 0.1
in latch s (impulse AR x 0)
