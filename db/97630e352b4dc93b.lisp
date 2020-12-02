; free-self-when-done
(let* ((x (mouse-x kr -1 1 0 0.1))
       (e (linen x 1 0.1 1 remove-synth)))
  (mul (sin-osc ar 440 0) e))
