-- sinOsc ; event control
let f c (g,_,_,z,o,rx,_,p,_,_) =
      let freq_mod = sinOsc KR (tRand (c,'α') 0.02 0.06 g) 0 * tRand (c,'β') 0.1 2 g
          amp_mod = sinOsc KR (tRand (c,'γ') 1 3 g / 60) 0 `in_range` (0.2, 0.5)
          s = sinOsc AR (lag (midiCPS p) (rx * 2) + freq_mod) (tRand (c,'δ') 0 (2 * pi) g)
          l = sinOsc KR o (tRand (c,'ε') 0 pi g) * tRand (c,'ζ') 0.1 0.99 g
      in pan2 s l (lagUD g 0 1 * z * amp_mod)
in mix (rEventVoicer 16 f) * control KR "gain" 1.5
