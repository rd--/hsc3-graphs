-- http://www.fredrikolofsson.com/f0blog/?q=node/537 (f0) ; slow to start...
let fib = 0 : scanl (+) 1 fib
    sc3_fib k = take k (tail fib)
    n = map ((* 99) . (`mod` 8)) (sc3_fib 16)
    p = dseq dinf (dshuf 8 (mce (map fromInteger n)))
    q = combN (duty ar (1/8) 0 DoNothing p) 4 4 16
    o = lfTri ar q 0 / 4
    f = lfTri kr (1/16) 0 * 2e3 + 3e3
in pan2 (moogFF o f 2 0) 0 0.5
