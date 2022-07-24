; asLocalBuf ; combines LocalBuf and SetBuf
(let* ((b (asLocalBuf 1 (list 60 62 63 65 67 69 70 72)))
       (m (Index b (MulAdd (LFSaw 0.5 -1) 4 4))))
  (Mul (SinOsc (Lag2 (MidiCps m) 0.1) 0) 0.05))
