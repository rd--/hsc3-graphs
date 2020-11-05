-- data space (jmcc) #2
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

data_space :: UId m => m UGen
data_space = do
    let r = randM 0
    let p0 = lfPulse KR #(r 200) 0 #(r 1)
    p1 <- lfPulse KR #(r 40) 0 #(r 1) *. r 8000 .+. r 2000
    let p2 = lfPulse KR #(r 20) 0 #(r 1)
    p3 <- lfPulse KR #(r 4) 0 #(r 1) *. r 8000 .+. r 2000
    let p4 = lfPulse KR #(r 20) 0 #(r 1)
    p5 <- lfPulse KR #(r 4) 0 #(r 1) *. r 8000 .+. r 2000
    let f = p0 * p1 + p2 * p3 + p4 * p5
    dt <- randM 0.15 0.35
    let o = lfPulse AR f 0 0.5 * 0.04
    l <- lfNoise0M KR #(r 3) .* 0.8
    return (combL (pan2 o l 1) dt dt 3)

main :: IO ()
main = overlapTextureU (1,6,4,maxBound) =<< data_space
