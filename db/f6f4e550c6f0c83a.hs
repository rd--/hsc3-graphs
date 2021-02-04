-- membraneHexagon ; event control
let f _ (g,x,y,z,o,rx,_,_) =
      let ex = pinkNoise 'α' AR * envGen KR g z 0 0.1 DoNothing (envPerc (0.02 * rx) 1)
          tn = x * 0.1
          ls = linExp y 0 1 0.999999 0.9999
      in pan2 (X.membraneHexagon AR ex tn ls) (o * 2 - 1) 1
in mix (rEventVoicer 8 f) * control KR "gain" 1
