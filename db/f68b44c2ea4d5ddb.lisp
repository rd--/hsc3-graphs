; pause-self-when-done
(let* ((x (mouse-x kr -1 1 0 0.1))
       (e (linen x 1 0.1 1 pause-synth)))
  (mul (sin-osc ar 440 0) e))
