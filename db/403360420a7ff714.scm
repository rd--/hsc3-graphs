; LeakDc
(let ((a (Mul (LfPulse 800 0.5 0.5) 0.025)))
  (Mce2 a (LeakDc a 0.995)))
