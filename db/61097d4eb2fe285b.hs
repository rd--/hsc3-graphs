-- stkInst ; flute ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Flute.html
let f _ (g,_,y,z,o,rx,ry,p,_,_) =
      let kJetDelay = 2
          kNoiseGain = 4
          kVibratoFrequency = 11
          kVibratoGain = 1
          kBreathPressure = 128
          args = [kJetDelay,y * 128
                 ,kNoiseGain,rx * 64
                 ,kVibratoFrequency,(1 - ry) * 64
                 ,kVibratoGain,ry * 16
                 ,kBreathPressure,linLin z 0 1 48 96]
          s = X.stkInst ar (midiCps p) g 0.75 0.5 (X.stkAt "Flute") (mce args)
      in pan2 s (o * 2 - 1) g
in mix (eventVoicer 16 f) * control kr "gain" 0.5
