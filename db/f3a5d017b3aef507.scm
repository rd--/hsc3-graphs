; detectsilence
(let ((s (Mul (SinOsc ar 440 0) (MouseY kr 0 0.4 0 0.1))))
  (mrg2 (Mul s 0.1) (DetectSilence s 0.1 0.2 remove-synth)))
