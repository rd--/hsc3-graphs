-- f-lets (rd. 2006-09-28)
let f_let t g j n f =
      let pd = pulseDivider t j 0
      in formlet pd (f * tiRand (mce2 2 1) n pd) (tRand 0.01 0.04 pd) (tRand 0.05 0.10 pd) * g
    mk_n t =
      sum [f_let t 0.15 2 9 (mce2 200 400)
          ,f_let t 0.25 2 9 (mce2 (200 + tRand 0 1 t) (400 + tRand 0 1 t))
          ,f_let t 0.05 4 5 (mce2 25 50)
          ,f_let t 0.15 4 5 (mce2 (25 + tRand 0 1 t) (50 + tRand 0 1 t))
          ,f_let t 0.5 1 16 (mce2 300 600) * latch (coinGate 0.2 t) t]
in mk_n (impulse ar 24 0) * (lfNoise0 kr 2 * 0.25 + 0.25)
