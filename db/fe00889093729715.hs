-- vosimOsc ; event control
let f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = x * 40 + 10
          form1freq = y * 900 + 100
          form2freq = rx * 900 + 100
          shape = ry
      in pan2 (X.vosimOsc ar freq form1freq form2freq shape) (o * 2 - 1) (g * z)
in mix (voicer 16 f) * control kr "gain" 1
