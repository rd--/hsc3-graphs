-- replaceOut ; a writes noise to bus 24, b reads 24 and replaces with filtered variant, c reads 24 and writes to 0
let a = pinkNoise 'α' AR * 0.1
    b = bpf (in' 1 AR 24) 440 1
    c = in' 1 AR 24
in mrg [out 0 c, replaceOut 24 b, out 24 a]
