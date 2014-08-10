-- harmonic swimming (jmcc) #1

import Sound.SC3 {- hsc3 -}

harmonic_swimming :: UId m => m UGen
harmonic_swimming =
    let a = 0.02
        f = 50
        p = 20
        l = line KR 0 (- a) 60 DoNothing
        o h = do r <- clone 2 (randM 2 8)
                 n <- lfNoise1M KR r
                 let e = max 0 (n * a + l)
                 return (fSinOsc AR (f * (h + 1)) 0 * e)
    in fmap sum (mapM o [0..p])

main :: IO ()
main = audition . out 0 =<< harmonic_swimming
