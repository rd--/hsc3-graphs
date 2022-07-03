-- alien froggies (jmcc) #1 ; event control
let f (_,g,x,y,z,o,rx,_,_,_,_) =
      let r = fold (11 * exp (x * 0.4 - 0.2)) 1 30
          s = formant ar r (linExp y 0 1 200 3000) (rx * 9 * r + r)
      in pan2 s (o * 2 - 1) (0.5 * z * g)
in mix (voicer 16 f) * control kr "gain" 1
