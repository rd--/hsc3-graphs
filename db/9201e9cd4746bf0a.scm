; unk-sdrn
(overlapTextureGraph
 4 6 3
  (lambda (tr)
    (let* ((scale (Mce7 0 2 3 5 7 9 10))
           (m (Add3 (TChoose tr (Mce2 60 72)) (TChoose tr scale) (TRandN 2 -0.05 0.05 tr))))
      (Mul3 (SinOsc (MidiCps m) 0) (Lt (TRand 0 1 tr) 0.8) (TRand 0.04 0.07 tr)))))
