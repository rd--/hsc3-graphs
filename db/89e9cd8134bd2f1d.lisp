; convolution
(let ((input (sound-in (mce2 0 1)))
      (kernel (white-noise ar)))
  (mul (convolution input kernel 2048) 0.1))
