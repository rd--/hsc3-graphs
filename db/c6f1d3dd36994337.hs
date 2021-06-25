-- svf ; event control
let f c (g,x,y,z,o,rx,_,p,px,_) =
      let signal = lfSaw AR (midiCPS (p + px)) 0
          cutoff = linExp x 0 1 20 20000
          res = y
          ty = constant c
          low = (ty + 0) `modE` 5 * z
          band = (ty + 1) `modE` 5 * z
          high = (ty + 2) `modE` 5 * z
          notch = (ty + 3) `modE` 5 * z
          peak_ = (ty + 4) `modE` 5 * z
      in pan2 (X.svf signal cutoff res low band high notch peak_) (o * 2 - 1) (lagUD g 0.1 (rx * 9))
in mix (eventVoicer 16 f) * control KR "gain" 0.2
