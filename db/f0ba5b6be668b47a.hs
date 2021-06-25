-- theremin (jmcc) ; event control
let f _ (g,x,y,z,o,rx,_,_,_,_) =
      let freq = lag (linExp y 0 1 4000 200) 0.8
          a = sinOsc AR (freq + freq * sinOsc AR (4 + 3 * rx) 0 * 0.02) 0 * x * 0.6 * lag g 0.2
      in pan2 a (o * 0.25) (0.5 + z)
in mix (eventVoicer 16 f) * control KR "gain" 0.5
