; rotate2 ; rotation of B2 encoded signal
(let* ((p (mul (white-noise ar) 0.02))
       (q (mul (mix (lf-saw ar (make-mce (list 200 200.37 201)) 0)) 0.03))
       (e (add (pan-b2 p -0.5 1) (pan-b2 q -0.5 1)))
       (r (rotate2 (mce-channel e 1) (mce-channel e 2) (mouse-x kr -1 1 0 0.1))))
  (decode-b2 4 (mce-channel e 0) (mce-channel r 0) (mce-channel r 1) 0.5))
