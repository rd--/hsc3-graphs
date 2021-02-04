-- grainFM ; event control
let f _ (g,x,y,z,o,rx,ry,p) =
      let tr = impulse AR (y * 64 + 10) 0
          cf = midiCPS p
          mf = (cf * 1.5) + ((1 - x) * z * cf)
      in grainFM 2 tr (ry * 0.25) cf mf (1 + (rx * 0.25)) o (-1) 512 * z * lagUD g 0 2
in mix (rEventVoicer 16 f) * control KR "gain" 0.5
