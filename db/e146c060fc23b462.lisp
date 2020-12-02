; noise burst sweep (jmcc) #6
(let* ((n (clone 2 (lambda () (white-noise ar))))
       (lfo-rate (mouse-x kr 10 60 1 0.2))
       (amp (u:max 0 (lf-saw kr lfo-rate -1)))
       (cfreq (mouse-y kr 400 8000 1 0.2))
       (freq (mul-add (sin-osc kr 0.2 0) cfreq (mul 1.05 cfreq))))
  (resonz (mul n amp) freq 0.1))
