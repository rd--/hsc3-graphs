-- pm-crotale (dmc) #1.7 ; graph spawn texture variant
let f tr =
      let t = TRand 2 6 tr
          freq = MidiCps (TiRand 48 72 tr)
          env = EnvPerc 0 t 1 [-4, -4]
          mod = 5 + (1 / TiRand 2 6 tr)
          amp1 = EnvGen tr (TRand 0.1 0.3 tr) 0 t 0 env
          amp2 = EnvGen tr (TRand 0.1 0.5 tr) 0 (1.3 * t) 0 env
          sig = PmOsc  freq (mod * freq) (EnvGen tr (TRand 1 6 tr) 0 t 0 env) 0
      in Pan2 sig (TRand2 1 tr) (amp1 * amp2)
in (\() -> f (Dust 2)) !+ 5
