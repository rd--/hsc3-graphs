; leak-dc
(let ((a (mul (lf-pulse ar 800 0.5 0.5) 0.025)))
  (mce2 a (leak-dc a 0.995)))
