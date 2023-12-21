-- strummable silk (jmcc) #11
let mx = MouseX 0 1 linear 0.2
    im = Impulse 14 0
    str ix =
      let n = 15
          tr = Abs (HPZ1 (mx > (0.25 + ix * 0.07)))
          e = Decay (im * Lag (Trig tr 1) 0.2 * 0.01) 0.04
          freq0 = MidiCps (([-2, 0, 3, 5, 7, 10, 12, 15] !! ix) + 60)
          freq = map (* freq0) [1 .. n + 1]
          param = klankData freq (replicate n 1) (listFill n (\_ -> Rand 0.3 1))
      in Pan2 (Klank (PinkNoise () * e) 1 0 1 param) (ix * 0.2 - 0.5) 1
    rAllpass i = AllpassN i 0.1 [Rand 0 0.05, Rand 0 0.05] 4
in iter 6 rAllpass (LeakDc (Lpf (mixFill 8 str) 12000) 0.995)
