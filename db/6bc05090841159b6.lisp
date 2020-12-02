; poll ; multichannel expansion is not implemented
(let ((t (impulse kr 2 0))
      (i (line kr 0 1 5 remove-synth)))
  (poll t i 0 "test"))
