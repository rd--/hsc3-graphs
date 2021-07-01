-- demand ; monadic form
uid_st_eval (
  do r <- dustM kr 1
     s <- dgeomM dinf (midiCPS 72) (midiRatio 1)
     let t = impulse kr 10 0
         f = demand t r s
         o = sinOsc ar (mce [f,f + 0.7]) 0
     return (max (cubed o) 0 * 0.1))
