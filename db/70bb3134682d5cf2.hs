-- sinOsc ; event control
let f c (g,_,_,z,o,rx,_,p,_,_) =
      let freq_mod = sinOsc kr (tRand 0.02 0.06 g) 0 * tRand 0.1 2 g
          amp_mod = sinOsc kr (tRand 1 3 g / 60) 0 `in_range` (0.2, 0.5)
          s = sinOsc ar (lag (midiCps p) (rx * 2) + freq_mod) (tRand 0 (2 * pi) g)
          l = sinOsc kr o (tRand 0 pi g) * tRand 0.1 0.99 g
      in pan2 s l (lagUD g 0 1 * z * amp_mod)
in mix (eventVoicer 16 f) * control kr "gain" 1.5
