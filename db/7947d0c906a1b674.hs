-- resonator ; event control
let f _ (g,x,y,z,o,rx,ry,_,_,_) =
      let tr = trig g controlDur
          freq = midiCPS (x * 25 + 36)
          snare = X.analogSnareDrum ar tr 0 z 200 0.5 (tRandId 'α' 0.1 0.5 tr) 0.5
          sig = X.resonator snare freq 0 24 y rx (0.2 + ry)
      in pan2 (tanh sig) (o * 2 - 1) (lagUD g 0 6)
in mix (eventVoicer 16 f) * control kr "gain" 0.1
