; midicps ; demand ; mce
(let* ((t (Impulse (Mce2 7 10) 0))
       (s (Diwhite dinf 60 72))
       (f (Demand t 0 s))
       (o (SinOsc (MidiCps (Mce2 f (Add f 0.75))) 0)))
  (Mix (Mul (Cubed (Cubed o)) 0.1)))
