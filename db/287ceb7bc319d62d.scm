; tap ; use headphones
(let* ((b (ClearBuf (LocalBuf 1 48000))) ; SampleRate ; one second
       (src (SoundIn 0))
       (put (BufWr b (Phasor ar 0 1 0 (BufFrames kr b) 1) loop src))
       (get (Tap 1 ar b (Mce2 0.1 0.9))))
  (Mrg2 get put))
