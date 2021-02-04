-- grainSin ; event control
let f _ (g,_,y,z,o,rx,ry,p) =
      let tr = impulse AR (linLin y 0 1 6 72) 0
          du = linLin rx 0 1 0.01 0.15
      in grainSin 2 tr du (midiCPS (p + (ry * 2 - 1))) (o * 2 - 1) (-1) 512 * z * g
in mix (rEventVoicer 16 f) * control KR "gain" 1
