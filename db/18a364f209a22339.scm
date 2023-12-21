; FreeVerb ; c.f. FreeVerb2
(let* ((i (Impulse 1 0))
       (c (LfCub 1200 0))
       (s (Mul3 (Decay i 0.25) c 0.1))
       (x (MouseX 0 1 0 0.1))
       (y (MouseY 0 1 0 0.1)))
  (Mce2 s (FreeVerb s y x 0.5)))
