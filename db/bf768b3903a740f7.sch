-- ; analogue daze (jmcc) #3
let dsequ s tr = Demand tr 0 (Dseq dinf s)
    patternlist = [55, 63, 60, 63, 57, 65, 62, 65]
    f octave clockrate pwmrate fltrate =
        let trg = Impulse clockrate 0
            freq = map (MidiCps .  (+ (12 * octave))) patternlist
            sq = dsequ freq trg
            pwm = SinOsc pwmrate (Rand 0 (2 * pi)) * 0.4 + 0.5
            cf = SinOsc fltrate (Rand 0 (2 * pi)) * 1400 + 2000
        in RLPF (LFPulse (Lag sq 0.05) 0 pwm * 0.1) cf (1 / 15)
    a = LFNoise0 (LFNoise1 0.3 * 6000 + 8000) * [0.07,  0.08]
    x = Decay (Impulse 2 0) 0.15 * a
    g = [f 1 8 0.31 0.2, f 0 2 0.13 0.11] + x
    z = 0.4 * (CombN g 0.375 0.375 5 + reverse g)
    e = EnvLinen 2 56 2 1 []
in z * EnvGen 1 1 0 1 removeSynth e
