; k2a
(let* ((freq (Mul (FDiv (MouseX kr 0.1 40 1 0.1) BlockSize) SampleRate)))
  (Mul (mce2 (K2A (LFNoise0 kr freq))
             (LFNoise0 ar freq))
       0.1))
