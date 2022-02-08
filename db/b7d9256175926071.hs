-- stkInst ; bowed ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1Bowed.html
let f (_,g,_,y,z,o,rx,_,p,_,_) =
      let kBowPressure = 2
          kBowPosition = 4
          kVibratoFrequency = 11
          kVibratoGain = 1
          kVolume = 128
          args = [kBowPressure,1 + z * 127
                 ,kBowPosition,1 + y * 127
                 ,kVibratoFrequency,50
                 ,kVibratoGain,1
                 ,kVolume,1 + z * 127]
          s = X.stkInst ar (unitCps p) g (1 - rx) 0.5 (X.stkAt "Bowed") (mce args)
      in pan2 s (o * 2 - 1) g
in mix (eventVoicer 16 f) * control kr "gain" 1
