-- data space (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Events.OverlapTexture

randz :: ID a => a -> UGen -> UGen
randz e n = rand e 0 n

data_space :: UGen
data_space =
    let p0 = lfPulse KR (randz 'a' 200) 0 (randz 'b' 1)
	p1 = lfPulse KR (randz 'c' 40) 0 (randz 'd' 1) * randz 'e' 8000 + randz 'f' 2000
        p2 = lfPulse KR (randz 'g' 20) 0 (randz 'h' 1)
        p3 = lfPulse KR (randz 'i' 4) 0 (randz 'j' 1) * randz 'k' 8000 + randz 'l'  2000
        p4 = lfPulse KR (randz 'm' 20) 0 (randz 'n' 1)
        p5 = lfPulse KR (randz 'o' 4) 0 (randz 'p' 1) * randz 'q' 8000 + randz 'r'  2000
        f = p0 * p1 + p2 * p3 + p4 * p5
        dt = rand 's' 0.15 0.35
    in combL (pan2 (lfPulse AR f 0 0.5 * 0.04) (lfNoise0 't' KR (randz 'u' 3) * 0.8) 1) dt dt 3

main :: IO ()
main = overlapTextureU (6,1,4,maxBound) data_space
