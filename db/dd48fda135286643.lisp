; tw-index ; assuming normalized values
(let* ((prob (mce3 1/5 2/5 2/5))
       (freq (mce3 400 500 600))
       (f (select (tw-index (impulse kr 6 0) 0.0 prob) freq)))
  (mul (sin-osc ar f 0) 0.2))
