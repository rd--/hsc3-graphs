-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)
let fc = 400 + (LfNoise2 [1, 2] `toLinRange` (100, 200))
    fm = LfNoise0 5 `toLinRange` (100, 200)
    i = LfNoise1 10 `toLinRange` (1, 20)
    x = SinOsc (fc + (SinOsc fm 0 * i * fm)) 0 * 0.5
    rf = SinOsc (LfNoise1 1 `toLinRange` (0.1, 1)) 0 `toLinRange` (1000, 2000)
    rq = LfNoise1 1 `toLinRange` (0.5, 10)
    a = Rlpf x rf rq
    ph = a * (LfNoise1 0.1 `toLinRange` (1.0, 4.0)) * 4 * pi
in SinOsc 0.2 ph * 0.1
