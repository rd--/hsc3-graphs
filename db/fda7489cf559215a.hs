-- ring modulated klank (jmcc) #2 ; texture=overlap,4,4,4,inf ; id
let p = 8
    k = let sp = klankSpec_mce (X.randNId p 'α' 100 10000)
                               (mce (replicate p 1))
                               (X.randNId p 'α' 0.2 1)
        in klank (dustId 'α' ar 20 * 0.02) 1 0 1 sp
    f = lfNoise2Id 'α' kr (randId 'α' 0.1 0.4) * 200 + randId 'α' 350 400
in pan2 (sinOsc ar f 0 * k) (randId 'α' (-1) 1) 1
