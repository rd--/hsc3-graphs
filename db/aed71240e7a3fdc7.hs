-- formlet ; event control
let f c (g,x,y,z,o,rx,_,_,_,_) =
      let s = blip ar (sinOsc kr 5 0 * 20 * constant (c + 1) + 300) (2000 * rx)
      in pan2 (formlet s (linExp y 0 1 700 2000) 0.005 (linExp x 0 1 0.01 0.2)) (o * 2 - 1) (g * z)
in mix (eventVoicer 16 f) * control kr "gain" 1
