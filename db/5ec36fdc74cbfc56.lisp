; SampleRate ; compare sine tone derived from sample rate with a 440Hz tone
(let ((freq (mce2 (Mul SampleRate 0.01) 440)))
  (Mul (SinOsc ar freq 0) 0.05))
