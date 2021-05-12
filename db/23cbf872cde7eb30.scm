; FreeVerb ; c.f. free-verb2
(let* ((i (Impulse ar 1 0))
       (c (LFCub ar 1200 0))
       (s (mul3 (Decay i 0.25) c 0.1))
       (x (MouseX kr 0 1 0 0.1))
       (y (MouseY kr 0 1 0 0.1)))
  (mce2 s (FreeVerb s y x 0.5)))
