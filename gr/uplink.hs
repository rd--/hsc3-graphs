-- uplink (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

randz :: ID a => a -> UGen -> UGen
randz e = rand e 0

-- > Sound.SC3.UGen.Dot.draw uplink
uplink :: UGen
uplink =
    let r = randz
        p0 = lfPulse KR (r 'α' 20) 0 (r 'β' 1)
        p1 = lfPulse KR (r 'γ' 4) 0 (r 'δ' 1) * r 'ε' 8000 + r 'ζ' 2000
        f = mix (uclone 'η' 2 (p0 * p1))
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'θ' (-0.8) 0.8) 1

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) uplink
