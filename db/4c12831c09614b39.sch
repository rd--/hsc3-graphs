-- rukano; Apr 22,  2012; Re: Epic Pads (jar)
let freq_f _ = MidiCps (listChoose [60, 64, 65, 67]) * (LFNoise2 1 * 0.011 + 1)
    freq = mceFill 24 freq_f
    gen = LFSaw freq 0 * 0.1
    fmod = LFCub (1 / 12) 0 `toLinRange` (1, MouseX 2 16 linear 0.2) -- modulate filter with mouse
    rqmod = LFNoise2 (1 / 8) `toLinRange` (0.1, 1)
    sig = RLPF gen (freq * fmod) rqmod
    amp = MouseY 0 0.25 linear 0.2
in Splay sig 1 1 0 True * amp
