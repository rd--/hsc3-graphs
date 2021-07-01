-- latch ; sample & hold
let n = whiteNoiseId 'α' ar
    i = impulse ar 9 0
    l = latch n i
in blip ar (l * 400 + 500) 4 * 0.2
