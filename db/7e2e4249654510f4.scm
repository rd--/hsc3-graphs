; demand
(let* ((t (Impulse kr 10 0))
       (r (Dust kr 1))
       (s (Dgeom dinf (MidiCps 72) (MidiRatio 1)))
       (f (Demand t r s))
       (o (SinOsc ar (Mce2 f (Add f 0.7)) 0)))
  (Mul (Max (Cubed o) 0) 0.1))
