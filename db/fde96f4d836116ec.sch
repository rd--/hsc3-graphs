-- alien froggies (jmcc) #1
let f tr =
      let r = fold (11 * (exp (rtlinrandn 2 (-0.2) 0.2 0 tr))) 1 30
      in formant r (rtexprandn 2 200 3000 tr) (rtrandn 2 0 9 tr * r + r) * 0.05
in overlaptexture 0.25 0.5 5 f
