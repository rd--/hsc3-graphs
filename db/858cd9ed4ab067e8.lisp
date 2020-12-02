; detect-silence
(let ((s (mul (sin-osc ar 440 0) (mouse-y kr 0 0.4 0 0.1))))
  (mrg2 (mul s 0.1) (detect-silence s 0.1 0.2 remove-synth)))
