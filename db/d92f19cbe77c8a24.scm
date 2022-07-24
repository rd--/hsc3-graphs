; rcd ; rotating clock divider
(let* ((freqs (map (lambda (i) (MidiCps (Add (Mul i 5) 50))) (enumFromTo 0 8)))
       (amps (list 1 0.5 0.3 0.3 0.3 0.2 0.2 0.2))
       (tr (LFPulse 7 0 0.01))
       (rot -2)
       (spread (TIRand 0 1 (Impulse 0.13 0)))
       (dv (TIRand 0 3 (Impulse 0.1 0)))
       (pulses (rcd tr rot 0 dv spread 0 0 0 1))
       (oscs (Mul (Mul (SinOsc freqs 0) pulses) amps))
       (sig (Splay (mceRotate 3 oscs) 1 0.25 0 #t)))
  (Add sig (Mul (CombN sig 2 (list 2 1) 3) 0.3)))
