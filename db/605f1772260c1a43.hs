-- analogTape ; event control
let bias = control kr "bias" 0.25
    saturation = control kr "saturation" 0.25
    drive = control kr "drive" 0.25
    f (_,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCps (x * 12 + 48)
          width = y
          sig = varSaw ar freq 0 width
      in pan2 (X.analogTape sig (bias + rx) (saturation + ry) (drive + o) 1 0) (o * 2 - 1) (z * g)
in mix (voicer 12 f) * control kr "gain" 1
