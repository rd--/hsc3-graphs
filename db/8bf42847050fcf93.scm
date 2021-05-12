; GVerb
(let* ((i (Impulse ar (mce2 1 2) 0))
       (c (LFCub ar (mce2 900 1200) 0))
       (s (mul3 (Decay i (mce2 0.05 0.25)) c 0.05)))
  (mix (GVerb s 10 3 0.5 0.5 15 1 0.7 0.5 300)))
