-- lfSaw ; saw-tooth wave as sum of sines, for all partials n amplitude is (1 / n) ; phase is always 0
let mk_freq f0 n = f0 * fromInteger n
    mk_amp n = 1 / fromInteger n
    mk_param f0 n = let m = [1,2 .. n] in zip (map (mk_freq f0) m) (map mk_amp m)
    x = midiCPS (mouseX KR 20 72 Linear 0.2)
    y = mouseY KR 0.01 0.1 Exponential 0.2
    e = xLine KR 0.01 1 20 DoNothing -- cross-fade from sum to lfSaw
    o1 = sum (map (\(fr,am) -> sinOsc AR fr 0 * am) (mk_param x 25)) * (1 - e)
    o2 = lfSaw AR x 0 * e
in mce2 o1 o2 * y
