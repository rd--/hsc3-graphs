-- weaklyNonlinear2 ; event control
let f _ (g,x,y,z,o,_,_,_,_,_) =
      let input = saw ar 261.626 * linExp y 0 1 0.0001 1
          freq = x * 300 + 100
      in pan2 (X.weaklyNonlinear2 ar input 0 1 1 freq 0 0 0 0 0 0) (o * 2 - 1) (z * g)
in mix (eventVoicer 16 f) * control kr "gain" 0.5
