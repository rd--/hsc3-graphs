; decay ; impulse triggers decay to create an exponential decay envelope
(mul (decay (impulse ar (x-line kr 1 50 20 remove-synth) 0.25) 0.1) (pink-noise ar))
