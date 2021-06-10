; SampleDur ; compare a sine tone derived from sample rate with a 440Hz tone
(let ((freq (Mce2 (Mul (Recip SampleDur) 0.01) 440)))
  (Mul (SinOsc ar freq 0) 0.05))
