; SelectX ; as sequencer
(let* ((n 10)
       (a (asMce (list 517 403 89 562 816 107 241 145 90 224)))
       (c (/ n 2))
       (f (SelectX (MulAdd (LFSaw kr 0.5 0) c c) a)))
  (Mul (Saw ar f) 0.2))
