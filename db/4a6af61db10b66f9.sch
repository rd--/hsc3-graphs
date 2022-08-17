-- alien froggies (jmcc) #1
let f tr =
      let r = Fold (11 * (exp (TLinRandN 2 (-0.2) 0.2 0 tr))) 1 30
      in Formant r (TExpRandN 2 200 3000 tr) (TRandN 2 0 9 tr * r + r) * 0.05
in OverlapTexture f 0.25 0.5 5
