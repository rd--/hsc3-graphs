-- clustered sines (jmcc) #2 ; texture=XFade,4,4,inf ; edit for packet size
let cs () =
      let n = 65
          f1 = Rand 100 1100
          y = Dup (\() -> f1 + Rand 0 (4 * f1)) n
      in SinOscBank y (map (f1 /) y) [0] * 0.3 / n
in Dup cs 2
