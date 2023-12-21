-- 2006-09-14 (rd) ; texture=overlap, 21, 0, 3, inf ; edit for packet size
let chrd () =
      let m = IRandN 6 60 84 -- [60,  65,  72,  77,  79,  84]
          d = map (* 3) [5,  4,  5,  7,  4,  5]
          f = MidiCps (XLn m (m + Rand 0.05 0.5) d)
          z = EnvTrapezoid 0 (Rand 0.15 0.35) d (Rand 0.005 0.01)
          e = EnvGen 1 1 0 1 doNothing z
          p = XLn (Rand2 1) (Rand2 1) d
      in Mix (Pan2 (FSinOsc f 0) p e)
in chrd ! 5
