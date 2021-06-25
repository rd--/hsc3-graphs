-- resonator ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCPS (x * 25 + 36)
          sig = X.resonator (pinkNoise 'α' AR * z) freq 0 24 y rx (0.2 + ry)
      in pan2 (tanh sig) (o * 2 - 1) (lagUD g 0 2)
in mix (eventVoicer 16 f) * control KR "gain" 0.1
