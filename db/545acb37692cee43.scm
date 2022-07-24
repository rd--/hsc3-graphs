; analogue daze (jmcc) #3
(let* ((pattern (list 55 63 60 63 57 65 62 65))
       (sequ (lambda (s tr) (Demand tr 0 (Dseq dinf (asMce s)))))
       (f (lambda (octave clockrate pwm-rate flt-rate)
            (let* ((trg (Impulse clockrate 0))
                   (pattern* (map (lambda (x) (MidiCps (Add x (Mul 12 octave)))) pattern))
                   (sq (sequ pattern* trg))
                   (pwm (MulAdd (SinOsc pwm-rate (Rand 0 twoPi)) 0.4 0.5))
                   (cf (MulAdd (SinOsc flt-rate (Rand 0 twoPi)) 1400 2000)))
              (RLPF (Mul (LFPulse (Lag sq 0.05) 0 pwm) 0.1) cf (Fdiv 1 15)))))
       (a (Mul (LFNoise0 (MulAdd (LFNoise1 0.3) 6000 8000)) (Mce2 0.07 0.08)))
       (x (Mul (Decay (Impulse 2 0) 0.15) a))
       (g (Add (Mce2 (f 1 8 0.31 0.2) (f 0 2 0.13 0.11)) x))
       (z (Mul 0.4 (Add (CombN g 0.375 0.375 5) (mceReverse g))))
       (e (envLinen 2 56 2 1 nil)))
  (Mul z (EnvGen 1 1 0 1 removeSynth e)))
