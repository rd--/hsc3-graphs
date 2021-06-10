; BufSampleRate ; compare a sine tone derived from sample rate of a buffer with a 440hz tone
(let* ((b (ctl kr "buf" 0))
       (freq (Mce2 (Mul (BufSampleRate ir b) 0.01) 440)))
  (Mul (SinOsc ar freq 0) 0.1))
