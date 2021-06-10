-- https://twitter.com/redFrik/status/1125557217086857216 (f0)
let scl = [0, 2.94, 4.98, 7.02, 9.96] -- pythagorean
    b = map (\x -> (x + 0.7) * 2 / 666) [-7 .. 6]
    m = degreetokey (aslocalbuf 1 scl) ((lftri b b * lftri b 0 * 9 + 9) % 32) 12 + 24
    o = varsaw (midicps m) 0 ((lftri b 0 + 1) / 2) * ampcomp m 440 (1/3) * lftri b b * b * 9
    s = rlpf o (lag2 m ((1 / b) % 1) * 3) 1
in tanh (splay (allpassn s 0.3 (0.2 - b) 3) 1 1 0 true)
