; decay ; c.f. decay2
(mul3 (decay (impulse ar (x-line kr 1 50 20 remove-synth) 0.25) 0.01)
      (f-sin-osc ar 600 0)
      0.25)
