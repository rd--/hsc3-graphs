-- rukano; Apr 22,  2012; Re: Epic Pads (jar)
let freq_f _ = MidiCps (choose [60, 64, 65, 67]) * (LfNoise2 1 * 0.011 + 1)
    freq = mceFill 24 freq_f
    gen = LfSaw freq 0 * 0.1
    fmod = LfCub (1 / 12) 0 `toLinRange` (1, MouseX 2 16 linear 0.2) -- modulate filter with mouse
    rqmod = LfNoise2 (1 / 8) `toLinRange` (0.1, 1)
    sig = Rlpf gen (freq * fmod) rqmod
    amp = MouseY 0 0.25 linear 0.2
in Splay2 sig * amp
