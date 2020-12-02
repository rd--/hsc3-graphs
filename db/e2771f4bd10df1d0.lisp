; bpf
(let* ((f1 (mouse-x kr 220 440 0 0.1))
       (f2 (mce2 f1 (sub 550 f1)))
       (rq (mouse-y kr 0 0.01 0 0.1)))
  (bpf (white-noise ar) f2 rq))
