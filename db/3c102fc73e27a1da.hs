-- duty
uid_st_eval (
  do n0 <- drandM dinf (mce [0.01,0.2,0.4])
     n1 <- dseqM dinf (mce [204,400,201,502,300,200])
     let f = duty KR n0 0 RemoveSynth n1
     return (sinOsc AR (f * mce2 1 1.01) 0 * 0.1))
