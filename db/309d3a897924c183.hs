-- nv ; https://twitter.com/headcube/status/437094206767513600
let x = impulse ar 0.05 0
    f i =
      let n = lfNoise2 kr
          a = allpassL (leakDC i 0.995) 4 ((8 ** n 0.1) / 2) 8 * 1.2
      in tanh (lpf a ((8 ** n (mce2 (rand 0 0.1) (rand 0 0.1))) * 2500))
in ugen_optimise_ir_rand (mixFill 4 (\_ -> iter 20 f x * 5))
