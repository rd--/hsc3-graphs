-- tWindex
let p = mce [1/5, 2/5, 2/5]
    a = mce [400, 500, 600]
    t = impulse kr 6 0
    i = tWindexId 'α' t 0 p
in sinOsc ar (select i  a) 0 * 0.1
