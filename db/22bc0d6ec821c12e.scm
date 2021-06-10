; FSinOsc ; loses Amplitude towards the end
(let ((f (MulAdd (FSinOsc ar (XLine kr 4 401 8 removeSynth) 0) 200 800)))
  (Mul (FSinOsc ar f 0) 0.15))
