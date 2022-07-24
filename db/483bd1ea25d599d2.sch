-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)
let fc = 400 + (LFNoise2 [1,  2] `toLinRange` (100, 200))
    fm = LFNoise0 5 `toLinRange` (100, 200)
    i = LFNoise1 10 `toLinRange` (1, 20)
    x = SinOsc (fc + (SinOsc fm 0 * i * fm)) 0 * 0.5
    rf = SinOsc (LFNoise1 1 `toLinRange` (0.1, 1)) 0 `toLinRange` (1000, 2000)
    rq = LFNoise1 1 `toLinRange` (0.5, 10)
    a = RLPF x rf rq
    ph = a * (LFNoise1 0.1 `toLinRange` (1.0, 4.0)) * 4 * pi
in SinOsc 0.2 ph * 0.1
