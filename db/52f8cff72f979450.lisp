; sample-rate ; compare sine tone derived from sample rate with a 440Hz tone
(let ((freq (mce2 (mul sample-rate 0.01) 440)))
  (mul (sin-osc ar freq 0) 0.05))
