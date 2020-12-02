; rand
(let* ((a (line kr 0.1 0 0.1 remove-synth))
       (p (rand -1 1))
       (s (mul (f-sin-osc ar (rand 200 1200) 0) a)))
  (pan2 s p 1))
