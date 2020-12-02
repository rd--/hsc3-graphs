; decay2 ; an envelope
(mul3 (decay2 (impulse ar (x-line kr 1 50 20 remove-synth) 0.25) 0.01 0.2)
      (f-sin-osc ar 600 0)
      0.25)
