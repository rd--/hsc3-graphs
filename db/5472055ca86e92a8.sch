-- rukano; Apr 22, 2012; Re: Epic Pads (jar)
let freq_f _ = midicps (listchoose [60,64,65,67]) * (lfnoise2 1 * 0.011 + 1)
    freq = mcefill 24 freq_f
    gen = lfsaw freq 0 * 0.1
    fmod = lfcub (1 / 12) 0 `tolinrange` (1,mousex 2 16 linear 0.2) -- modulate filter with mouse
    rqmod = lfnoise2 (1 / 8) `tolinrange` (0.1,1)
    sig = rlpf gen (freq * fmod) rqmod
    amp = mousey 0 0.25 linear 0.2
in splay sig 1 1 0 true * amp
