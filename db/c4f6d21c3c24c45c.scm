; Demand - ?
(let* ((t (Impulse 10 0))
       (r (Dust 1))
       (s (Dgeom inf (MidiCps 72) (MidiRatio 1)))
       (f (Demand t r s))
       (o (SinOsc (Mce2 f (Add f 0.7)) 0)))
  (Mul (Max (Cubed o) 0) 0.1))
