-- insects (sp)
let insect _ =
      let a = sinOsc kr (rand 1 10) 0 * 0.5 + 0.5
          o = sinOsc ar (rand 2000 3000 + lfNoise2 kr (rand 0.05 0.1 * 50 + 50)) (rand 0.05 0.1) * 0.005 * a
      in pan2 o (lfNoise2 kr (rand 0.05 0.1)) 1
in mixFill 60 insect
