; DetectSilence
(let ((s (Mul (SinOsc 440 0) (MouseY 0 0.4 0 0.1))))
  (Mrg2 (Mul s 0.1) (DetectSilence s 0.1 0.2 removeSynth)))
