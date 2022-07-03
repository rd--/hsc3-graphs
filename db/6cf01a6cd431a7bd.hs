-- theremin (jmcc) ; event control
let f (_,w,x,y,z,o,rx,_,_,_,_) =
      let freq = lag (linExp y 0 1 4000 200) 0.8
          a = sinOsc ar (freq + freq * sinOsc ar (4 + 3 * rx) 0 * 0.02) 0 * x * 0.6 * lag w 0.2
      in pan2 a (o * 0.25) (0.5 + z)
in mix (voicer 16 f) * control kr "gain" 0.5
