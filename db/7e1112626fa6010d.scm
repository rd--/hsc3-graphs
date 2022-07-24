; rotate2 ; rotation of B2 encoded signal
(let* ((p (Mul (WhiteNoise) 0.02))
       (q (Mul (Mix (LFSaw (asMce (list 200 200.37 201)) 0)) 0.03))
       (e (Add (PanB2 p -0.5 1) (PanB2 q -0.5 1)))
       (r (Rotate2 (mceChannel e 1) (mceChannel e 2) (MouseX -1 1 0 0.1))))
  (DecodeB2 4 (mceChannel e 0) (mceChannel r 0) (mceChannel r 1) 0.5))
