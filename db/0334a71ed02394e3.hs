-- random sine waves (jmcc) #1 ; event control
let f _ (g,x,_,z,o,_,_,_,_,_) =
      let s = fSinOsc AR (x * 2000) 0
      in pan2 s (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control KR "gain" 0.5
