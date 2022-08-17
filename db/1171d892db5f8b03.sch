-- chrd (rd,  2006-09-14) ; texture=overlap, 21, 0, 3, inf ; edit for packet size
let chrd () =
      let m = Dup (\() -> IRand 60 84) 6 -- [60,  65,  72,  77,  79,  84]
          d = map (* 3) [5,  4,  5,  7,  4,  5]
          f = MidiCps (XLine m (m + Rand 0.05 0.5) d doNothing)
          z = EnvTrapezoid 0 (Rand 0.15 0.35) d (Rand 0.005 0.01)
          e = EnvGen 1 1 0 1 doNothing z
          p = XLine (Rand2 1) (Rand2 1) d doNothing
      in Mix (Pan2 (FSinOsc f 0) p e)
in Dup chrd 5
