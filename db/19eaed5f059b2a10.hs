-- tBetaRand
let t = dust 'α' KR 10
    f = X.tBetaRand 'β' 300 3000 0.1 0.1 t
in sinOsc AR f 0 * 0.1
