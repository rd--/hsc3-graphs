-- http://sccode.org/1-V (nv)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Bind as P {- hsc3-lang -}

-- > import Sound.SC3.UGen.Dot
-- > let u = let [p,q] = mceChannels (in' 2 AR 0) in out 0 (mce2 (p + 1) (fF p q))
-- > draw u
fF :: (UnaryOp a, RealFracE a, BinaryOp a) => a -> a -> a
fF i f =
    let n = (((modE (2 * i) 6) + 1) + floorE f) / ((modE i 5) + 1)
    in modE (f + log2 n) 2

-- > import Sound.SC3.Plot
-- > let fS' = map (2 **) fS
-- > plotImpulses [take 600 (drop 0 fS')] -- 32 128 250 500 750
fS :: [Double]
fS =
    let lp i f = let f' = fF i f in f' : lp (i + 1) f'
    in lp 0 0

nvi :: Synthdef
nvi =
    let i = control KR "i" 0
        f = control KR "f" 0
        p = (i `modE` 8 + 2) * 52
        e = line KR 0.1 0 1 RemoveSynth
        o = syncSaw AR ((2 ** f) * 99 + mce2 0 1) p * e
    in synthdef "nvi" (out 0 o)

main :: IO ()
main =
    let p = [("f",fS)
            ,("i",[0..])
            ,("dur",repeat 0.3)]
    in audition (P.sbind1 (nvi,p))
