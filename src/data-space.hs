-- data space (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

randz :: ID a => a -> UGen -> UGen
randz e = rand e 0

data_space :: UGen
data_space =
    let r = randz
        p0 = lfPulse KR (r 'a' 200) 0 (r 'b' 1)
	p1 = lfPulse KR (r 'c' 40) 0 (r 'd' 1) * r 'e' 8000 + r 'f' 2000
        p2 = lfPulse KR (r 'g' 20) 0 (r 'h' 1)
        p3 = lfPulse KR (r 'i' 4) 0 (r 'j' 1) * r 'k' 8000 + r 'l'  2000
        p4 = lfPulse KR (r 'm' 20) 0 (r 'n' 1)
        p5 = lfPulse KR (r 'o' 4) 0 (r 'p' 1) * r 'q' 8000 + r 'r'  2000
        f = p0 * p1 + p2 * p3 + p4 * p5
        dt = rand 's' 0.15 0.35
        o = lfPulse AR f 0 0.5 * 0.04
        l = lfNoise0 't' KR (r 'u' 3) * 0.8
    in combL (pan2 o l 1) dt dt 3

main :: IO ()
main = overlapTextureU (6,1,4,maxBound) data_space
