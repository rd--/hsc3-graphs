; freeselfwhendone
(let* ((x (MouseX kr -1 1 0 0.1))
       (e (Linen x 1 0.1 1 remove-synth)))
  (Mul (SinOsc ar 440 0) e))
