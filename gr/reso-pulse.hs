-- reso-pulse (jmcc) #1

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: ID a => a -> UGen -> UGen
rand2 k n = rand k (-n) n

reso_pulse :: UGen
reso_pulse =
    let f = midiCPS (lchoose 'α' [25,30,34,37,41,42,46,49,53,54,58,61,63,66])
        f' = 2 * f + rand2 'β' 0.5
    in (lfPulse AR f 0 0.2 + lfPulse AR f' 0 0.2) * 0.02

reso_pulse_pp :: UGen -> UGen
reso_pulse_pp z =
    let lfoFreq = 6
        lfo = lfNoise0 'γ' KR lfoFreq * 1000 + 1200
        x = mouseX KR 0.2 0.02 Exponential 0.2
        left = rlpf z lfo x
        delayTime = 2 / lfoFreq
        right = delayN left delayTime delayTime
    in mce2 left right

main :: IO ()
main = overlapTextureU_pp (4,2,4,maxBound) reso_pulse 1 reso_pulse_pp
