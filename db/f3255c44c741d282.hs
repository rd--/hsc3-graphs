-- spring ; event control
let f _ (w,x,y,z,o,rx,_,_,_,_) =
      let k = linExp x 0 1 0.1 20
          d = linExp y 0 1 0.00001 0.065
          s = spring ar (k2a w) k d
          freq = midiCps (x * 24 + 48) + (s * 800 * rx) -- modulate frequency with the force
      in pan2 (sinOsc ar freq 0) (o * 2 - 1) (w * z * z)
in mix (eventVoicer 16 f) * control kr "gain" 2
