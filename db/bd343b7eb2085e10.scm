; Pulse ; two band limited square waves Thru a resonant low pass filter
(RLPF (Mul (Pulse ar (mce2 100 250) 0.5) 0.05)
      (XLine kr 8000 40 5 remove-synth)
      0.05)
