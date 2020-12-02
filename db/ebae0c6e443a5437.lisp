; bpf
(let* ((f1 (x-line kr 0.7 300 20 remove-synth))
       (f2 (mul-add (f-sin-osc kr f1 0) 3600 4000)))
  (bpf (mul (saw ar 200) 0.25) f2 0.3))
