-- event ; simple frequency modulation
let f _ (g,x,y,z,o,_,_,_,_,_) =
      let cR = 1 -- carrier ratio
          mR = 2 -- modulation ratio
          mI = y * 3 -- modulation index
          f0 = midiCps (x * 25 + 48)
          f1 = f0 * cR
          f2 = f0 * mR
          o2 = sinOsc ar f2 0
          o1 = sinOsc ar (f1 + (o2 * mI * f2)) 0
      in pan2 o1 (o * 2 - 1) (z * z * g)
in mix (eventVoicer 16 f) * control kr "gain" 4
