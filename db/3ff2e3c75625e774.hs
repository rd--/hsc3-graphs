-- tWindex
let p = mce [1/5, 2/5, 2/5]
    a = mce [400, 500, 600]
    t = impulse KR 6 0
    i = tWindex 'α' t 0 p
in sinOsc AR (select i  a) 0 * 0.1
