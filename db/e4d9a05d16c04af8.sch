-- pm-crotale (dmc) #1.7 ; graph spawn texture variant
let f tr =
      let art = TRand 2 6 tr
          freq = MidiCps (TIRand 48 72 tr)
          env = envPerc 0 art 1 [-4,-4]
          mod = 5 + (1 / TIRand 2 6 tr)
          amp1 = EnvGen kr tr (TRand 0.1 0.3 tr) 0 art 0 env
          amp2 = EnvGen kr tr (TRand 0.1 0.5 tr) 0 (1.3 * art) 0 env
          sig = PMOsc ar freq (mod * freq) (EnvGen kr tr (TRand 1 6 tr) 0 art 0 env) 0
      in Pan2 sig (TRand2 1 tr) (amp1 * amp2)
in Splay (mceFill 5 (\_ -> f (Dust kr 0.05))) 1 1 0 True
