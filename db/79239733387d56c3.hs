-- stkInst ; brass ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Brass.html
let f _ (g,_,y,z,o,rx,ry,p) =
      let kLipTension = 2
          kSlideLength = 4
          kVibratoFrequency = 11
          kVibratoGain = 1
          kVolume = 128
          args = [kLipTension,latch rx g * 127
                 ,kSlideLength,latch y g * 127
                 ,kVibratoFrequency,ry * 48
                 ,kVibratoGain,1
                 ,kVolume,6 + z * 24]
          s = X.stkInst AR (midiCPS p) g (1 - rx) 0.5 (X.stkAt "Brass") (mce args)
      in pan2 s (o * 2 - 1) g
in mix (rEventVoicer 16 f) * control KR "gain" 2
