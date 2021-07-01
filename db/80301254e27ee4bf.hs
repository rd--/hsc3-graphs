-- resonz ; pinkNoise ; event control
let f c (g,_,y,z,o,rx,_,p,_,_) =
      let (gt,_) = eventGateReset g p
          e = envGen kr gt 1 0 1 DoNothing (envPerc 0.01 (1 + rx))
          f = midiCPS p {- centre frequency -}
          rq = linLin y 0 1 0.05 0.25 / f {- 1/Q (reciprocal of Q) -}
          scl = 900
      in pan2 (resonz (pinkNoiseId c ar) f rq * scl * z) (o * 2 - 1) e
in mix (eventVoicer 16 f) * control kr "gain" 1
