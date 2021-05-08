; panb2 ; c.f. decode-b2
(let ((e (PanB2 (PinkNoise ar) (MouseX kr -1 1 0 0.1) 0.1)))
  (DecodeB2 4 (mce-channel e 0) (mce-channel e 1) (mce-channel e 2) 0))
