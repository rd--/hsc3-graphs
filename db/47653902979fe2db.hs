-- tRand
let t = dust 'α' KR (mce2 5 12)
    f = tRand 'β' (mce2 200 1600) (mce2 500 3000) t
in sinOsc AR f 0 * 0.1
