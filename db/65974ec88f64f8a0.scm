; BPF
(let* ((f1 (MouseX kr 220 440 0 0.1))
       (f2 (Mce2 f1 (Sub 550 f1)))
       (rq (MouseY kr 0 0.01 0 0.1)))
  (BPF (WhiteNoise ar) f2 rq))
