; Bpf
(let* ((f1 (MouseX 220 440 0 0.1))
       (f2 (Mce2 f1 (Sub 550 f1)))
       (rq (MouseY 0 0.01 0 0.1)))
  (Bpf (WhiteNoise) f2 rq))
