-- red_frik (f0)
let red tr n =
      let o1 = fSinOsc kr (tRand 0.3 5 tr) 0 * tRand 0 0.5 tr + tRand 0.49 0.56 tr
          o2 = fSinOsc kr o1 0 * tRand 0.3 0.6 tr + tRand 0.3 0.5 tr
      in rhpf n (tRand 0.3 3 tr) o2 * 0.1
    n = mceFill 2 (\_ -> brownNoise ar)
    tr = impulse kr 0.1 0
in red tr n * 0.1
