-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)

import Data.List {- base -}
import Sound.SC3 {- hsc3 -}

type T4 a = (a,a,a,a)

-- > param 6
param :: Fractional n => Int -> [T4 n]
param n =
    let f g z = take n (iterate g z)
    in zip4 (f (* 4) 2) (f (/ 2) (1/2)) (f (* 4) 1) (f (* 4) 2)

gen :: UGen -> T4 UGen -> UGen
gen f0 (m,f1,l,r) = sinOsc AR f0 0 * m + linExp (sinOsc AR f1 0) (-1) 1 l r

-- audition (pkt_07 12)
-- Sound.SC3.UGen.Dot.draw (pkt_07 6)
pkt_07 :: Int -> UGen
pkt_07 n =
    let c = foldl gen 1 (param n)
        o = sinOsc AR c 0 * 0.1
    in out 0 (gVerb (leakDC o 0.995) 16 8 0.75 0.5 15 1 0.7 0.5 16)

main :: IO ()
main = audition (pkt_07 6)
