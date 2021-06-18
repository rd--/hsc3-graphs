-- https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html (mn)
let fc = 400 + (lfnoise2 [1, 2] `tolinrange` (100,200))
    fm = lfnoise0 5 `tolinrange` (100,200)
    i = lfnoise1 10 `tolinrange` (1,20)
    x = sinosc (fc + (sinosc fm 0 * i * fm)) 0 * 0.5
    rf = sinosc (lfnoise1 1 `tolinrange` (0.1,1)) 0 `tolinrange` (1000,2000)
    rq = lfnoise1 1 `tolinrange` (0.5,10)
    a = rlpf x rf rq
    ph = a * (lfnoise1 0.1 `tolinrange` (1.0,4.0)) * 4 * pi
in sinosc 0.2 ph * 0.1
