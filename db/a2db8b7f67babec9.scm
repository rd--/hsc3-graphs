; 20061013 (rd) ; requires kr:
(let* ((o1
        (let* ((t (Dust 2))
               (e (EnvBreakPointLinear (list 0 (TRand 0.05 0.5 t) 1 1 0) 1 1))
               (d (TRand 0.15 0.25 t))
               (a (EnvGen t (TRand 0.02 0.04 t) 0 d doNothing e))
               (p (EnvGen t (TRand 1.0 2.0 t) -1.0 d doNothing e))
               (n (TChoose t (Mce4 0 2 5 7)))
               (o 72))
          (Pan2 (SinOsc (kr: (MidiCps (Add n o))) 0) p a)))
       (shft
        (lambda ()
          (let* ((t (Impulse 12 0))
                 (e (EnvBreakPointLinear (list 0 (TRand 0.25 1.0 t) 1 1 0) 1 1))
                 (d (TRand 0.05 0.125 t))
                 (a (EnvGen t (TRand 0.02 0.04 t) 0 d doNothing e))
                 (p (EnvGen t (TRand 1.0 2.0 t) -1.0 d doNothing e))
                 (n (TChoose t (Mce8 0 0 5 7 7 12 12 19)))
                 (o (Add 84 (Mul (ToggleFF t) 12))))
            (Pan2 (Saw (kr: (MidiCps (Add n o)))) p a))))
       (o2
        (Mul (Add3 (shft) (shft) (shft)) 0.1))
       (o3
        (let* ((t (Impulse 6 0))
               (e (EnvBreakPointLinear (list 0 (TRand 0.25 1.0 t) 1 1 0) 1 1))
               (d (TRand 0.05 0.25 t))
               (a (EnvGen t (TRand 0.01 0.02 t) 0 d doNothing e))
               (p (EnvGen t (TRand 1.0 2.0 t) -1.0 d doNothing e))
               (n (Demand t 0 (Dibrown inf 0 7 1)))
               (o 52)
               (b (asLocalBuf (list 0 2 3.2 5 7 9 10))))
          (Pan2 (Saw (kr: (MidiCps (DegreeToKey b (Add n o) 12)))) p a)))
       (o4
        (Mul
	 (Rlpf
	  (LfPulse (MidiCps (Mce2 36 43)) 0.15 0.5)
          (MidiCps (Add (Mul (SinOsc 0.1 0) 10) 36))
          0.1)
         0.1)))
  (Add4 o1 o2 o3 o4))
