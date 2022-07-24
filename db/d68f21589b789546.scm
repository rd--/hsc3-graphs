; InFeedback ; evaluate these In either order and hear both tones
(let ((b (Add (NumInputBuses) (NumOutputBuses))))
  (Mrg2
   (Mul (SinOsc 660 0) 0.1)
   (Out b (Mul (SinOsc 440 0) 0.1))))
