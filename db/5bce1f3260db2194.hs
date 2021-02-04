-- dwgPlucked2 ; event control
let f _c (g,_,y,z,o,rx,_,p) =
      let freq = midiCPS p
          c3 = 20
          inp = let e = envelope [0,1,1,0] [0.001,0.006,0.0005] (map EnvNum [5,-5,-8])
                in z * lfClipNoise 'α' AR 2000 * envGen AR g 1 0 1 DoNothing e
          ps = X.dwgPlucked2 AR freq 1 y 0.1 1 c3 inp 0.1 (1 + rx * 0.05) 0.55 (0.1 * z)
      in pan2 ps (o * 2 - 1) 1
in mix (rEventVoicer 16 f) * control KR "gain" 0.75
