; k2a
(let* ((block-size (f-div sample-rate control-rate))
       (freq (mul (f-div (mouse-x kr 0.1 40 1 0.1) block-size) sample-rate)))
  (mul (mce2 (k2a (lf-noise0 kr freq))
             (lf-noise0 ar freq))
       0.1))
