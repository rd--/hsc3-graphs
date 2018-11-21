-- analogue daze (jmcc) #3

import qualified Sound.SC3.Common as Common {- hsc3 -}
import Sound.SC3.UGen.Record.CRU {- hsc3-rec -}

-- > draw analogue_daze
analogue_daze :: UGen
analogue_daze =
    let pattern = [55,63,60,63,57,65,62,65]
        sequ k s tr = Demand tr 0 (Dseq k dinf (mce s))
        f z0 z1 octave clockRate pwmrate fltrate =
            let trg = Impulse KR clockRate 0
                pattern' = map (midiCPS .  (+ (12 * octave))) pattern
                sq = sequ 'α' pattern' trg
                pwm = SinOsc KR pwmrate (Rand z0 0 (2 * pi)) * 0.4 + 0.5
                cf = SinOsc KR fltrate (Rand z1 0 (2 * pi)) * 1400 + 2000
            in RLPF (LFPulse AR (Lag sq 0.05) 0 pwm * 0.1) cf (1/15)
        a = LFNoise0 'β' AR (LFNoise1 'γ' KR 0.3 * 6000 + 8000) * (mce2 0.07 0.08)
        x = Decay (Impulse AR 2 0) 0.15 * a
        g = mce [f 'δ' 'ε' 1 8 0.31 0.2,f 'ζ' 'η' 0 2 0.13 0.11] + x
        z = 0.4 * (CombN g 0.375 0.375 5 + mceReverse g)
        e = Common.envLinen 2 56 2 1
    in z * envGen {rate = KR, doneAction = RemoveSynth, envelope_ = e}

main :: IO ()
main = audition (Out 0 analogue_daze)
