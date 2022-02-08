-- bMoog ; event control
let f (c,g,x,y,z,o,rx,ry,_,_,_) =
      let md = constant c `modE` 3
          f0 = linExp x 0 1 20 12000
          sig = lfSaw ar (mce2 (f0 * 0.99) (f0 * 1.01)) 0 * ry * 0.4
          cf = sinOsc kr (sinOsc kr 0.1 0) (1.5 * pi) * rx * 1550 + 1800
          flt = X.bMoog sig cf y md 0.95
      in pan2 ((combN flt 0.5 (mce2 0.4 0.35) 2 * 0.4) + (flt * 0.5)) (o * 2 - 1) (lagUD g 0 3 * z)
in mix (eventVoicer 16 f) * control kr "gain" 1
