; pan-b2 ; c.f. decode-b2
(let ((e (pan-b2 (pink-noise ar) (mouse-x kr -1 1 0 0.1) 0.1)))
  (decode-b2 4 (mce-channel e 0) (mce-channel e 1) (mce-channel e 2) 0))
