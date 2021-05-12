; rotate2 ; rotation of B2 encoded signal
(let* ((p (Mul (WhiteNoise ar) 0.02))
       (q (Mul (mix (LFSaw ar (make-mce (list 200 200.37 201)) 0)) 0.03))
       (e (Add (PanB2 p -0.5 1) (PanB2 q -0.5 1)))
       (r (Rotate2 (mce-channel e 1) (mce-channel e 2) (MouseX kr -1 1 0 0.1))))
  (DecodeB2 4 (mce-channel e 0) (mce-channel r 0) (mce-channel r 1) 0.5))
