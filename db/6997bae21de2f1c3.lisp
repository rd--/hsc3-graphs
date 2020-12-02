; pv-bin-shift
(let ((snd (let* ((f1 (squared (mul-add (sin-osc kr 0.08 0) 6 6.2)))
                  (f2 (sin-osc kr f1 0)))
             (sin-osc ar (mul-add f2 100 800) 0)))
      (x (mouse-x kr -10 100 0 0.1))
      (y (mouse-y kr 1 4 0 0.1)))
  (mul (ifft* (pv-bin-shift (fft* (local-buf 1 2048) snd) y x 0)) 0.1))
