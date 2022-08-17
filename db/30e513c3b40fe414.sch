-- birdies (jmcc)
let f tr =
      let p1 = LFPulse (TRand 0.4 1.4 tr) 0 (TRand 0.1 0.9 tr) * TRand 4 7 tr + 2
          p2 = LFPulse (TRand 0.4 1.4 tr) 0 (TRand 0.1 0.9 tr) * TRand 4 7 tr
          p3 = LFPulse (TRand 0.2 0.7 tr) 0 0.4 * 0.02
          sw = LFSaw (p1 + p2) 0 * neg (TRand 1000 1800 tr) + 4000 + TRand2 1200 tr
      in Pan2 (SinOsc (Lag sw 0.05) 0 * Lag p3 0.3) (TRand2 1 tr) 1
in OverlapTexture f 7 4 4
