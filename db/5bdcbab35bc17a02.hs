-- dwgPluckedStiff ; event control
let f _c (g,_,y,z,o,rx,_,p,_,_) =
      let freq = midiCps p
          c3 = 20
          inp = let e = envelope [0,1,1,0] [0.001,0.006,0.0005] (map EnvNum [5,-5,-8])
                in z * lfClipNoiseId 'α' ar 2000 * envGen ar g 1 0 1 DoNothing e
          ps = X.dwgPluckedStiff ar freq 1 y 0.1 (1 - rx * 0.01) c3 inp 0.1 (z * 4)
      in pan2 ps (o * 2 - 1) 1
in mix (eventVoicer 16 f) * control kr "gain" 0.5
