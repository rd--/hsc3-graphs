import Sound.SC3.Common {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3-m -}

-- | 'demand' of 'dseq', somewhat akin to SC2 Sequencer.
dsequ :: [UGen] -> UGen -> UGen
dsequ s tr = demand tr 0 (dseq dinf (mce s))

analogue_daze :: UGen
analogue_daze =
    let patternList = [55,63,60,63,57,65,62,65]
        f octave clockRate pwmrate fltrate =
            let trg = impulse KR clockRate 0
                freq = map (midiCPS .  (+ (12 * octave))) patternList
                sq = dsequ freq trg
                pwm = sinOsc KR pwmrate (rand 0 (2 * pi)) * 0.4 + 0.5
                cf = sinOsc KR fltrate (rand 0 (2 * pi)) * 1400 + 2000
            in rlpf (lfPulse AR (lag sq 0.05) 0 pwm * 0.1) cf (1/15)
        a = lfNoise0 AR (lfNoise1 KR 0.3 * 6000 + 8000) * (mce2 0.07 0.08)
        x = decay (impulse AR 2 0) 0.15 * a
        g = mce [f 1 8 0.31 0.2,f 0 2 0.13 0.11] + x
        z = 0.4 * (combN g 0.375 0.375 5 + {-mceReverse-} g)
        e = envLinen 2 56 2 1
    in z * envGen KR 1 1 0 1 RemoveSynth e

main :: IO ()
main = audition_st analogue_daze
