-- sample and hold liquidities (jmcc) #4 ; event control
let f _ (g,_,y,z,o,_,_,p,px,_) =
      let env = decay2 (trig g controlDur * z * 2) (0.01 + y * 0.1) (0.5 + y * 0.4)
          sig = pan2 (sinOsc ar (midiCps (p + px)) 0 * env) (o * 2 - 1) 1
      in sig + combN sig 0.3 0.3 2
in mix (eventVoicer 16 f) * control kr "gain" 1
