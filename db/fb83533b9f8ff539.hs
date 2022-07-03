-- dwgFlute ; event control
let f (c,g,x,y,z,o,rx,ry,_,_,_) =
      let freq = midiCps (x * 25 + 42)
          vib = sinOsc kr 4 0 + (0.01 * z * whiteNoiseId c ar)
          pm = k2a ((0.1 + z) * vib * g)
          endr = linLin ry 0 1 0.35 0.65
          jetr = linLin y 0 1 0.65 0.85 * lagUD g 0.001 0.25
          jetRa = linLin rx 0 1 0.25 0.85 * lagUD g 0.001 0.25
          signal = X.dwgFlute ar freq pm endr jetr jetRa 1 0.01
      in pan2 (hpf (lpf signal 6000) 200) (o * 2 - 1) 1
in mix (voicer 16 f) * control kr "gain" 0.25
