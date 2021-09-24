-- vOsc3 ; event control ; see vOsc help for setup
let f _ (g,_,y,z,_,_,_,p,_,_) =
      let n = 8
          f0 = midiCps p
          b = control kr "tbl" 0
          pos = linLin y 0 1 b (b + n - 1)
          o1 = vOsc3 ar pos f0 (f0 + 1) (f0 + 9)
          o2 = vOsc3 ar pos (f0 - 1) (f0 + 3) (f0 + 4)
      in mce2 o1 o2 * g * z
in mix (eventVoicer 16 f) * control kr "gain" 0.25
