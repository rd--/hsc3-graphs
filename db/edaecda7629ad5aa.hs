-- membraneCircle ; event control
let f (_,g,x,y,z,o,_,_,_,_,_) =
      let loss = linExp y 0 1 0.99999 0.99950
          wobble = sinOsc kr 2 0
          tension = linExp x 0 1 0.01 0.1 + (wobble * 0.0001)
          p = envPerc 0.0001 (1 - z)
          e = envGen kr g (z + y / 4) 0 0.1 DoNothing p
      in pan2 (X.membraneCircle ar (pinkNoiseId 'α' ar * e) tension loss) (o * 2 - 1) 1
in mix (voicer 6 f) * control kr "gain" 1
