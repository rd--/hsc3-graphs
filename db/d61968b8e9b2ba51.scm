; panb2 ; c.f. decode-b2
(let ((e (PanB2 (PinkNoise) (MouseX -1 1 0 0.1) 0.1)))
  (DecodeB2 4 (mceChannel e 0) (mceChannel e 1) (mceChannel e 2) 0))
