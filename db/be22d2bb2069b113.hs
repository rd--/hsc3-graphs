-- pulsing bottles (jmcc) #2 ; texture=overlap,4,4,4,maxBound ; id
let r z = let n = whiteNoiseId z ar
              r0 = randId z 4 14
              r1 = randId z 0 0.7
              r2 = randId z 400 7400
          in resonz (n * lfPulse kr r0 0 0.25 * r1) r2 0.01
    s z = let f = randId z 0.1 0.5
              p = randId z 0 (pi * 2)
          in sinOsc kr f p
in sum (zipWith3 pan2 (map r (id_seq 6 'α')) (map s (id_seq 6 'β')) (repeat 1))
