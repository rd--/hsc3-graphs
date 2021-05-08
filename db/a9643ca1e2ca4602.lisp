; Convolution
(let ((input (sound-in (mce2 0 1)))
      (kernel (WhiteNoise ar)))
  (Mul (Convolution input kernel 2048) 0.1))
