; decodeb2 ; note four channel output
(let ((e (PanB2 (PinkNoise ar) (MouseX kr -1 1 0 0.1) 0.1)))
  (DecodeB2 4 (mce-channel e 0) (mce-channel e 1) (mce-channel e 2) 0))
