-- random pulsations (jmcc) #1 ; event control
let f (_,g,x,y,z,o,rx,_,_,_,_) =
      let e = envLinen 2 5 2 0.02
          o1 = fSinOsc ar (x * 2000) 0 * envGen kr g 1 0 1 DoNothing e
          o2 = sinOsc ar (y * 80 + 8) 0
          o3 = sinOsc kr (o * 0.5 + 0.3) (rx * 2 * pi) * 0.7
      in pan2 (o1 `amClip` o2) o3 (z * 5 * lagUD g 0 12)
in mix (voicer 16 f) * control kr "gain" 1
