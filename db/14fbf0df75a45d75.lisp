; rhpf
(rhpf (mul (saw ar 200) 0.1)
      (mul-add (f-sin-osc kr (x-line kr 0.7 300 20 remove-synth) 0) 3600 4000)
      0.2)
