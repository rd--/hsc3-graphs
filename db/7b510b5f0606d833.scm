; Demand
(let* ((t (Impulse 10 0))
       (s (MidiCps (Diwhite dinf 60 72)))
       (f (Demand t 0 s))
       (o (SinOsc (Mce2 f (Add f 0.7)) 0)))
  (Mul (Cubed (Cubed o)) 0.1))
