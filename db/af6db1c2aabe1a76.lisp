; pulse ; two band limited square waves thru a resonant low pass filter
(rlpf (mul (pulse ar (mce2 100 250) 0.5) 0.05)
      (x-line kr 8000 40 5 remove-synth)
      0.05)
