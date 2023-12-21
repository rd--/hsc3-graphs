-- ; analogue daze (jmcc) #3
let dSequ s tr = Demand tr 0 (Dseq inf s)
    patternList = [55, 63, 60, 63, 57, 65, 62, 65]
    f octave clockRate pwmRate fltRate =
        let trg = Impulse clockRate 0
            freq = map (MidiCps .  (+ (12 * octave))) patternList
            sq = dSequ freq trg
            pwm = SinOsc pwmRate (Rand 0 (2 * pi)) * 0.4 + 0.5
            cf = SinOsc fltRate (Rand 0 (2 * pi)) * 1400 + 2000
        in Rlpf (LfPulse (Lag sq 0.05) 0 pwm * 0.1) cf (1 / 15)
    a = LfNoise0 (LfNoise1 0.3 * 6000 + 8000) * [0.07,  0.08]
    x = Decay (Impulse 2 0) 0.15 * a
    g = [f 1 8 0.31 0.2, f 0 2 0.13 0.11] + x
    z = 0.4 * (CombN g 0.375 0.375 5 + reverse g)
    e = EnvLinen 2 56 2 1 []
in z * EnvGen 1 1 0 1 removeSynth e
