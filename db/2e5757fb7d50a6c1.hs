-- miElements ; metal, bells ; event control
let f _ (g,x,y,z,o,rx,_,_,_,_) =
      let tr = trig1 (k2a g) sampleDur
          inp = decay tr 0.01
          pit = x * 12 + 48
          geo = latch o g -- lfNoise1 'β' KR 0.1 * 0.5 + 0.5
          bri = latch y g
          dam = latch (0.9 - z) g
          md = 2
      in X.miElements AR 0 inp 0 pit 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 geo bri dam 0.2 0.3 md 0
in mix (rEventVoicer 6 f) * control KR "gain" 1
