; SelectX ; as sequencer ; control rate
(let* ((n 10)
       (a (list 517 403 89 562 816 107 241 145 90 224))
       (c (/ n 2))
       (f (kr: (SelectX (MulAdd (LFSaw 0.5 0) c c) a))))
  (Mul (Saw f) 0.1))
