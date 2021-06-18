-- http://sccode.org/1-e (jl)
let d0 = lpf (dust2 (lfnoise1 0.2 `tolinrange` (40,50))) 7000
    n0 = pinknoise () * (0.08 + lfnoise1 0.3 * 0.02) + d0
    e0 = line 0 1 10 donothing
    p0 = tanh (3 * gverb (hpf n0 400) 250 100 0.25 0.5 15 0.3 0.7 0.5 300 * e0)
    lfnoise1c f = clip (lfnoise1 f) 0 1
    n1 = pinknoise () * ((lfnoise1c 3 * lfnoise1c 2) ** 1.8)
    f1 = lfnoise1 1 `toexprange` (100,2500)
    e1 = line 0 0.7 30 donothing
    p1 = gverb (tanh (lpf (10 * hpf n1 20) f1)) 270 30 0.7 0.5 15 0.5 0.7 0.5 300 * e1
in limiter (p0 + p1) 1 0.01 * 0.2
