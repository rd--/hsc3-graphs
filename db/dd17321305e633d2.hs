-- t2a ; removing jitter by randomising offset
let tr = impulse kr (mouseX kr 1 100 Exponential 0.2) 0
    o = range 0 (blockSize - 1) (whiteNoiseId 'α' kr)
in ringz (t2a tr o) 880 0.1 * 0.4
