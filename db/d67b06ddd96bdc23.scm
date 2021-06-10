; Pulse ; two band limited square waves Thru a resonant low pass filter
(RLPF (Mul (Pulse ar (Mce2 100 250) 0.5) 0.05)
      (XLine kr 8000 40 5 removeSynth)
      0.05)
