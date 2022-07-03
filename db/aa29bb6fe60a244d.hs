-- random sine waves (jmcc) #1 ; event control
let f (_,g,x,_,z,o,_,_,_,_,_) =
      let s = fSinOsc ar (x * 2000) 0
      in pan2 s (o * 2 - 1) (z * g)
in mix (voicer 16 f) * control kr "gain" 0.25
