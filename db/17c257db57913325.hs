-- sonLPC ; event control
let f (c,g,x,y,z,o,_,_,_,_,_) =
      let nf = 1024 * 2
          hop = 1 / 4
          poles = linLin y 0 1 5 80
          sig = soundIn 0 * 4
          chain = X.sonLPC ar (localBufId c 1 nf) sig hop poles
          freq = midiCps (x * 24 + 36)
          exci = saw ar freq * z * g
      in pan2 (X.sonLPCSynthIn ar chain exci) (o * 2 - 1) 1
in mix (voicer 4 f) * control kr "gain" 1
