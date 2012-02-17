-- uplink (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

randz :: ID a => a -> UGen -> UGen
randz e = rand e 0

uplink :: UGen
uplink =
    let r = randz
        p0 = lfPulse KR (r 'α' 20) 0 (r 'α' 1)
        p1 = lfPulse KR (r 'β' 4) 0 (r 'β' 1) * r 'β' 8000 + r 'β' 2000
        f = mix (uclone 'γ' 2 (p0 * p1))
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'δ' (-0.8) 0.8) 1

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) uplink

{-
Sound.SC3.UGen.Dot.draw uplink
-}
