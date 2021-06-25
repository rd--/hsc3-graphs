-- analogTape ; event control
let bias = control KR "bias" 0.25
    saturation = control KR "saturation" 0.25
    drive = control KR "drive" 0.25
    f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCPS (x * 12 + 48)
          width = y
          sig = varSaw AR freq 0 width
      in pan2 (X.analogTape sig (bias + rx) (saturation + ry) (drive + o) 1 0) (o * 2 - 1) (z * g)
in mix (eventVoicer 12 f) * control KR "gain" 1
