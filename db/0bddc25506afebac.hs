-- tExpRand
let f = tExpRandId 'α' 300.0 3000.0 (dustId 'β' kr 10)
in sinOsc ar f 0 * 0.1
