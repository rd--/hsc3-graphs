-- tRand ; equal (sanity)
let t = dustId 'α' kr 1
    f = tRandId 'β' 120 240 t
in sinOsc ar (mce2 f f) 0 * 0.1
