-- deep trip (jmcc) #9

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.External.RDU.ID  {- sc3-rdu -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

deep_trip :: UGen
deep_trip =
    let f = midiCPS (lfNoise1 'α' KR (rand 'β' 0 0.3) * 60 + 70)
        a'' = sinOsc KR (rand 'γ' 0 40) 0 * 0.1
        a' = max 0 (lfNoise1 'δ' KR (rand 'ε' 0 8) * a'')
        a = lfNoise2 'ζ' AR (f * rand 'η' 0 0.5) * a'
        z = sinOsc AR f 0 * a
        s = pan2 z (lfNoise1 'θ' KR (rand 'ι' 0 5)) 1
        c0 = combN s 0.5 (randN 2 'κ' 0.3 0.5) 20
        c1 = combN s 0.5 (randN 2 'λ' 0.3 0.5) 20
        in s + c0 + c1

main :: IO ()
main = overlapTextureU (4,12,4,maxBound) deep_trip
