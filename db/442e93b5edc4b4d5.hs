-- stkInst ; clarinet ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Clarinet.html
let f _ (g,_,y,z,o,rx,ry,p) =
      let kReedStiffness = 2
          kNoiseGain = 4
          kVibratoFrequency = 11
          kVibratoGain = 1
          kBreathPressure = 128
          args = [kReedStiffness,y * 32
                 ,kNoiseGain,rx * 32
                 ,kVibratoFrequency,50
                 ,kVibratoGain,1
                 ,kBreathPressure,linLin z 0 1 48 64]
          s = X.stkInst AR (midiCPS p) g (1 - ry) 0.5 (X.stkAt "Clarinet") (mce args)
      in pan2 s (o * 2 - 1) g
in mix (rEventVoicer 16 f) * control KR "gain" 1
