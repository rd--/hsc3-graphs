; GVerb
(let* ((i (Impulse ar (Mce2 1 2) 0))
       (c (LFCub ar (Mce2 900 1200) 0))
       (s (Mul3 (Decay i (Mce2 0.05 0.25)) c 0.05)))
  (Mix (GVerb s 10 3 0.5 0.5 15 1 0.7 0.5 300)))
