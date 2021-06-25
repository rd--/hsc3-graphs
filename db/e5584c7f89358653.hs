-- membraneCircle ; event control
let f _ (g,x,y,z,o,_,_,_,_,_) =
      let loss = linExp y 0 1 0.99999 0.99950
          wobble = sinOsc KR 2 0
          tension = linExp x 0 1 0.01 0.1 + (wobble * 0.0001)
          p = envPerc 0.0001 (1 - z)
          e = envGen KR g (z + y / 4) 0 0.1 DoNothing p
      in pan2 (X.membraneCircle AR (pinkNoise 'α' AR * e) tension loss) (o * 2 - 1) 1
in mix (eventVoicer 6 f) * control KR "gain" 1
