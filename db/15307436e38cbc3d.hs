-- tBetaRand
let t = dustId 'α' kr 10
    f = X.tBetaRandId 'β' 300 3000 0.1 0.1 t
in sinOsc ar f 0 * 0.1
