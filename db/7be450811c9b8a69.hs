-- clustered sines (jmcc) #2 ; texture=xfade,4,4,inf ; id
let cs z =
      let n = 80
          f1 = randId 'α' 100 1100
          f2 = 4 * f1
          sp = let y = map (\zz -> f1 + randId (z,zz) 0 f2) (id_seq n 'β')
               in klangSpec y (map (f1 /) y) (replicate n 0)
      in klang ar 1 0 sp * (0.3 / fromIntegral n)
in mce (map cs (id_seq 2 'δ'))
