-- ; analogue daze (jmcc) #3
let dsequ s tr = demand tr 0 (dseq dinf s)
    patternlist = [55,63,60,63,57,65,62,65]
    f octave clockrate pwmrate fltrate =
        let trg = impulse clockrate 0
            freq = map (midicps .  (+ (12 * octave))) patternlist
            sq = dsequ freq trg
            pwm = sinosc pwmrate (rand 0 (2 * pi)) * 0.4 + 0.5
            cf = sinosc fltrate (rand 0 (2 * pi)) * 1400 + 2000
        in rlpf (lfpulse (lag sq 0.05) 0 pwm * 0.1) cf (1 / 15)
    a = lfnoise0 (lfnoise1 0.3 * 6000 + 8000) * [0.07, 0.08]
    x = decay (impulse 2 0) 0.15 * a
    g = [f 1 8 0.31 0.2,f 0 2 0.13 0.11] + x
    z = 0.4 * (combn g 0.375 0.375 5 + mcereverse g)
    e = envlinen 2 56 2 1 []
in z * envgen 1 1 0 1 removesynth e
