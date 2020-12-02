; buf-sample-rate ; compare a sine tone derived from sample rate of a buffer with a 440hz tone
(let* ((b (ctl kr "buf" 0))
       (freq (mce2 (mul (buf-sample-rate ir b) 0.01) 440)))
  (mul (sin-osc ar freq 0) 0.1))
