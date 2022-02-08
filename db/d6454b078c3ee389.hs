-- sinOsc ; event control ; id
let f (c,g,_,_,z,o,rx,_,p,_,_) =
      let freq_mod = sinOsc kr (tRandId (c,'α') 0.02 0.06 g) 0 * tRandId (c,'β') 0.1 2 g
          amp_mod = sinOsc kr (tRandId (c,'γ') 1 3 g / 60) 0 `in_range` (0.2, 0.5)
          s = sinOsc ar (lag (unitCps p) (rx * 2) + freq_mod) (tRandId (c,'δ') 0 (2 * pi) g)
          l = sinOsc kr o (tRandId (c,'ε') 0 pi g) * tRandId (c,'ζ') 0.1 0.99 g
      in pan2 s l (lagUD g 0 1 * z * amp_mod)
in mix (eventVoicer 16 f) * control kr "gain" 1.5
