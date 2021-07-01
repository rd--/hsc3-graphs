-- stkInst ; voicForm ; event control ; https://ccrma.stanford.edu/software/stk/classstk_1_1VoicForm.html
let f _ (g,_,y,z,o,rx,ry,p,_,_) =
      let kVoicedUnvoicedMix = 2
          kVowelPhonemeSelection = 4
          kVibratoFrequency = 11
          kVibratoGain = 1
          kLoudness = 128
          args = [kVoicedUnvoicedMix,lag rx 0.2 * 127
                 ,kVowelPhonemeSelection,lag y 0.2 * 16]
          s = X.stkInst ar (midiCPS p) g 1 0 (X.stkAt "VoicForm") (mce args)
      in pan2 s (o * 2 - 1) (z * lagUD g 0.1 2)
in mix (eventVoicer 16 f) * control kr "gain" 1
