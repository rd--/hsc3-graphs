-- tWindex ; modulating probability values
let p = mce [1/4, 1/2, sinOsc KR 0.3 0 * 0.5 + 0.5]
    a = mce [400, 500, 600]
    t = impulse KR 6 0
    i = tWindex 'α' t 1 p
in sinOsc AR (select i a) 0 * 0.1
