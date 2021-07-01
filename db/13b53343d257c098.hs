-- shifting pulses (rd, 2006-09-18)
let prt a f =
      let f' = f * linLin_b (sinOsc kr (rand 0.2 0.9) 0) 1 1.01 * rand 0.95 1.05
      in sinOsc ar (mce2 f f') 0 * a * mceFill 2 (\_ -> rand 0.95 1.05)
    prts n f a = sum (map (prt a) [f,f + f .. f * n])
    fmt = formant ar (mce2 20 21) (linLin_b (lfNoise2 kr 2) 10 100) 200 * 0.35
    pulses =
      let t = dust kr 0.75
          warp i = linLin i (-1) 1
          p = pulse ar (warp (mceFill 2 (\_ -> brownNoise kr)) 2 (mce2 11 15)) 0.01 * 0.1
          f = warp (mceFill 2 (\_ -> brownNoise kr)) 90 300
          rq = warp (mceFill 2 (\_ -> brownNoise kr)) 2 9
      in mrg2 (latch t t * rlpf p f rq) (sendTrig t 0 t)
in prts 2 900 0.008 + prts 9 40 0.022 + fmt + pulses
