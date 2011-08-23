-- uplink (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

randz :: ID a => a -> UGen -> UGen
randz e n = rand e 0 n

uplink :: UGen
uplink =
    let r = randz
        p0 = lfPulse KR (r 'a' 20) 0 (r 'b' 1)
	p1 = lfPulse KR (r 'c' 4) 0 (r 'd' 1) * r 'e' 8000 + r 'f' 2000
        p2 = lfPulse KR (r 'g' 20) 0 (r 'h' 1)
        p3 = lfPulse KR (r 'i' 4) 0 (r 'j' 1) * r 'k' 8000 + r 'l'  2000
        f = p0 * p1 + p2 * p3
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'm' (-0.8) 0.8) 1

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) uplink
