-- vosim ; event control
let f _ (g,_,y,z,o,rx,_,p,_,_) =
      let trg = impulse ar (midiCps p) 0
          frq = linExp y 0 1 440 880
      in pan2 (X.vosim ar trg frq 1 rx) (o * 2 - 1) (g * z)
in mix (eventVoicer 16 f) * control kr "gain" 1
