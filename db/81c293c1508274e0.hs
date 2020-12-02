-- latch ; sample & hold
let n = whiteNoise 'α' AR
    i = impulse AR 9 0
    l = latch n i
in blip AR (l * 400 + 500) 4 * 0.2
