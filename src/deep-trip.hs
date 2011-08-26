-- deep trip (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

deep_trip :: UGen
deep_trip =
    let f = midiCPS (lfNoise1 'a' KR (rand 'a' 0 0.3) * 60 + 70)
        a'' = sinOsc KR (rand 'b' 0 40) 0 * 0.1
        a' = max 0 (lfNoise1 'c' KR (rand 'd' 0 8) * a'')
        a = lfNoise2 'e' AR (f * rand 'f' 0 0.5) * a'
        z = sinOsc AR f 0 * a
        s = pan2 z (lfNoise1 'g' KR (rand 'h' 0 5)) 1
        c0 = combN s 0.5 (mce [rand 'i' 0.3 0.5,rand 'j' 0.3 0.5]) 20
        c1 = combN s 0.5 (mce [rand 'k' 0.3 0.5,rand 'l' 0.3 0.5]) 20
        in s + c0 + c1

main :: IO ()
main = overlapTextureU (12,4,4,maxBound) deep_trip
