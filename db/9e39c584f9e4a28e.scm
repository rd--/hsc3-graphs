; BufSampleRate ; compare a sine tone derived from sample rate of a buffer with a 440hz tone ; requires=buf
(let* ((b (ctl "buf" 0))
       (freq (Mce2 (Mul (BufSampleRate b) 0.01) 440)))
  (Mul (SinOsc freq 0) 0.1))
