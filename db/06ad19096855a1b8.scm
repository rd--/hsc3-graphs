; Convolution
(let ((input (SoundIn (Mce2 0 1)))
      (kernel (WhiteNoise)))
  (Mul (Convolution input kernel 2048) 0.1))
