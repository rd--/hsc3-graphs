; tap ; use headphones
(let* ((b (ClearBuf (LocalBuf 1 48000))) ; SampleRate ; one second
       (src (SoundIn 0))
       (put (BufWr b (Phasor 0 1 0 (BufFrames b) 1) loop src))
       (get (Tap 1 b (Mce2 0.1 0.9))))
  (Mrg2 get put))
