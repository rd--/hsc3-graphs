-- uplink (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

randz :: ID a => a -> UGen -> UGen
randz e n = rand e 0 n

uplink :: UGen
uplink =
    let p0 = lfPulse KR (randz 'a' 20) 0 (randz 'b' 1)
	p1 = lfPulse KR (randz 'c' 4) 0 (randz 'd' 1) * randz 'e' 8000 + randz 'f' 2000
        p2 = lfPulse KR (randz 'g' 20) 0 (randz 'h' 1)
        p3 = lfPulse KR (randz 'i' 4) 0 (randz 'j' 1) * randz 'k' 8000 + randz 'l'  2000
        f = p0 * p1 + p2 * p3
    in pan2 (lfPulse AR f 0 0.5 * 0.04) (rand 'm' (-0.8) 0.8) 1

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) uplink
