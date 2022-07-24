-- f0 <https://twitter.com/redFrik/status/1367808902457397250>
let rat = [76.1,  76.1,  64,  57,  38.1,  85.4,  32,  114,  42.7,  47.9,  95.9]
    f i =
      let f0 = (rat !! i) * ((SinOsc (1/16) 0 > 0) * 2 + 6 - (SinOsc (SinOsc (1/32) i) 0 / 20))
          z = SinOsc f0 0 / 9
          x = VarLagEnv (floor (SinOsc (1/64) 0 * 6 + 6)) 0.1 0 False
          y = VarLagEnv (SinOsc (SinOsc (1/4) (i / 11 * pi) < 0 * 2) 0 * 0.1) 0.01 (SinOsc 0.01 i) False
          dly = (i + x) % 11 / 33 + 0.1 + y
          dcy = SinOsc (1/9) 0 + 1
      in CombC z 0.5 dly dcy
in Tanh (Splay (map f [0 .. 10]) 1 1 0 True)
