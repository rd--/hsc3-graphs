; http://sccode.org/1-L (jl)
(let* ((n (Mce5 400 500 450 376 600))
       (d 1/20)
       (f1 (Demand (Impulse d (Mce2 0 0.5)) 0 (Dseq inf n)))
       (f2 (LinRange (LfPulse 8 0 (LinRange (LfTri d 1) 0 1)) (at f1 1) (at f1 2))))
  (Mul (Lpf (Mul (Saw (Mul (Max 376 f2) (Mce2 1 0.99))) 0.5) 8000) 0.1))