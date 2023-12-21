; MidiCps ; demand
(let* ((t (Impulse '(7 10) 0))
       (s (Diwhite inf 60 72))
       (f (Demand t 0 s))
       (o (SinOsc (MidiCps (list f (Add f 0.75))) 0)))
  (Mix (Mul (Cubed (Cubed o)) 0.1)))
