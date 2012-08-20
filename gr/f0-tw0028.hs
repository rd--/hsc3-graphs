-- http://www.fredrikolofsson.com/f0blog/?q=node/537

import Sound.SC3.ID {- hsc3 -}

fib :: Integral i => [i]
fib = 0 : scanl (+) 1 fib

-- sc3_fib 16 == [1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987]
sc3_fib :: Integral a => Int -> [a]
sc3_fib n = take n (tail fib)

f0_0028 :: UGen
f0_0028 =
    let n = map ((* 99) . (`mod` 8)) (sc3_fib 16)
        p = dseq 'a' dinf (dshuf 'a' 8 (mce (map fromInteger n)))
        q = combN (duty AR (1/8) 0 DoNothing p) 4 4 16
        o = lfTri AR q 0 / 4
        f = lfTri KR (1/16) 0 * 2e3 + 3e3
    in out 0 (pan2 (moogFF o f 2 0) 0 1)

main :: IO ()
main = audition f0_0028
