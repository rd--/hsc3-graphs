-- resonz ; pinkNoise ; event control
let f c (g,_,y,z,o,rx,_,p,_,_) =
      let (gt,_) = rEventGateReset g p
          e = envGen KR gt 1 0 1 DoNothing (envPerc 0.01 (1 + rx))
          f = midiCPS p {- centre frequency -}
          rq = linLin y 0 1 0.05 0.25 / f {- 1/Q (reciprocal of Q) -}
          scl = 900
      in pan2 (resonz (pinkNoise c AR) f rq * scl * z) (o * 2 - 1) e
in mix (rEventVoicer 16 f) * control KR "gain" 1
