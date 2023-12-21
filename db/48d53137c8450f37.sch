-- f0 ; https://twitter.com/redFrik/status/1210118661022867458
let b = map recip [2 .. 7]
    d = 1 / 48
    g = cos (cos 0)
    l =
      [0, -16, 0, -16, 0, 0, -16, 0, -16, 0, -16, 0, 0, 0, -16, -16, 47, 0, -16
      ,0, -16, 0, -16, 0, 0, -16, 0, 0, -16, 0, 0, 0, 0, 0, -5, -16, -16, -15]
    f = Duty b 0 doNothing (Dseq inf (map (+ 48) l))
    o = SinOscFb f (Max (SinOsc d 0) 0) * Sin (Cos 0)
    c = SinOsc 0 (pi ** o)
    p = PitchShift c g (Recip b) d d * b
in LeakDc (Splay2 (c + p)) 0.995 * g
