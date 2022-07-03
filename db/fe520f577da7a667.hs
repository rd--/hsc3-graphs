-- miElements ; metal, bells ; event control
let f (_,g,x,y,z,o,_,_,_,_,_) =
      let tr = trig1 (k2a g) sampleDur
          inp = decay (tr * z * 4) 0.01
          pit = latch x g * 12 + 36
          geo = latch y g * 0.4 + 0.5
          spc = o * 0.5 + 0.5
      in X.miElements ar 0 inp 0 pit 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 geo 0.4 0.9 0.2 spc 0 0
in mix (voicer 6 f) * control kr "gain" 1
