-- alien froggies (jmcc) #1 ; texture=overlap,0.25,0.5,5,inf
let alien_froggies_n r =
      let r' = fold (r * exp (linRand (-0.2) 0.2 0)) 1 30
          o = formant ar r' (expRand 200 3000) (rand 0 9 * r' + r')
      in o * 0.05
in alien_froggies_n 11
