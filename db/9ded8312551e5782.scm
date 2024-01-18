; TGrains
(let* ((b (ctl "buf" 0))
       (t-rate (MouseY 2 200 1 0.1))
       (dur (Div 4 t-rate))
       (t (Impulse t-rate 0))
       (i (MouseX 0 (BufDur b) 0 0.1)))
  (TGrains 2 t b 1 i dur 0 0.1 2))
