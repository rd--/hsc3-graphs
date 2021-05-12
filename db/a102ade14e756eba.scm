; tap ; use headphones
(let* ((b (ClearBuf (LocalBuf 1 48000))) ; SampleRate ; one second
       (src (sound-in 0))
       (put (BufWr b (Phasor ar 0 1 0 (BufFrames kr b) 1) loop src))
       (get (tap 1 ar b (mce2 0.1 0.9))))
  (mrg2 get put))
