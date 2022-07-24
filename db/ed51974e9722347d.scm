; SampleRate ; compare sine tone derived from sample rate with a 440Hz tone
(let ((freq (Mce2 (Mul (SampleRate) 0.01) 440)))
  (Mul (SinOsc freq 0) 0.05))
