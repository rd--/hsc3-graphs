; PlayBuf ; sine wave control of playback rate, negative rate plays backwards
(let ((b (ctl kr "buf" 0))
      (r (MulAdd (FSinOsc kr (XLine kr 0.2 8 30 removeSynth) 0) 3 0.6)))
 (PlayBuf 1 ar b (Mul (BufRateScale kr b) r) 1 0 1 0))
