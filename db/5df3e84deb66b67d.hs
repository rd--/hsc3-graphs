-- tWindex ; modulating probability values
let p = mce [1/4, 1/2, sinOsc kr 0.3 0 * 0.5 + 0.5]
    a = mce [400, 500, 600]
    t = impulse kr 6 0
    i = tWindexId 'α' t 1 p
in sinOsc ar (select i a) 0 * 0.1
