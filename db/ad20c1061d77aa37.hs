-- spring ; event control
let f _ (w,x,y,z,_,_,_,_,_,_) =
      let k = linExp x 0 1 0.5 100
          d = linExp y 0 1 0.0001 0.1
          t = trig (k2a w) 0
          m0 = spring ar (k2a w) k 0.01
          m1 = spring ar m0 (0.5 * k) d
          m2 = spring ar m0 (0.6 * k) d
          m3 = spring ar (mce2 m1 m2) (0.4 * k) d
          m4 = spring ar (m3 - m1 + m2) (0.1 * k) d
          dt = linLin m4 (-10) 10 (x/8000) (x/100)
      in combL (trig (k2a w) (z * 0.05)) 0.1 dt ((latch y w + 1) * 9)
in mix (eventVoicer 16 f) * control kr "gain" 2
