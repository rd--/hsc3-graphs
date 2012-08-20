-- deep trip (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

deep_trip :: UGen
deep_trip =
    let f = midiCPS (lfNoise1 'a' KR (rand 'a' 0 0.3) * 60 + 70)
        a'' = sinOsc KR (rand 'b' 0 40) 0 * 0.1
        a' = max 0 (lfNoise1 'c' KR (rand 'd' 0 8) * a'')
        a = lfNoise2 'e' AR (f * rand 'f' 0 0.5) * a'
        z = sinOsc AR f 0 * a
        s = pan2 z (lfNoise1 'g' KR (rand 'h' 0 5)) 1
        c0 = combN s 0.5 (randN 2 'i' 0.3 0.5) 20
        c1 = combN s 0.5 (randN 2 'j' 0.3 0.5) 20
        in s + c0 + c1

main :: IO ()
main = overlapTextureU (4,12,4,maxBound) deep_trip