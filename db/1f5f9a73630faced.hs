-- tRand
let t = dustId 'α' kr (mce2 5 12)
    f = tRandId 'β' (mce2 200 1600) (mce2 500 3000) t
in sinOsc ar f 0 * 0.1
