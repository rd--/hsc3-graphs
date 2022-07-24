; InFeedback ; resonator, see LocalOut for variant
(let* ((b (Add (NumInputBuses) (NumOutputBuses)))
       (p (InFeedback 1 b))
       (i (Mul (Impulse 1 0) 0.5))
       (d (DelayC (Add i (Mul p 0.995)) 1 (Sub (Recip 440) (Recip (ControlRate))))))
  (Mrg2 p (OffsetOut b d)))
