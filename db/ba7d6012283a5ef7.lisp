; amplitude
(let* ((a (amplitude (ar: (soundin 0)) 0.01 0.01))
       (f (muladd a 1200 400)))
  (mul (sinosc (kr: f) 0) 0.1))
