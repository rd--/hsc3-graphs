; cps-midi
(let ((f (line kr 600 900 5 remove-synth)))
  (mul (saw ar (midi-cps (cps-midi f))) 0.05))
