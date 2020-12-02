; shepard tones (alberto de campo)
(letrec
    ((tbl-sz 512)
     (iota (lambda (n l j)
             (if (= n 0)
                 nil
                 (cons l (iota (- n 1) (+ l j) j)))))
     (indxs
      (lambda (n l r)
        (iota n l (/ (- r l) n))))
     (hanning-window
      (lambda (n)
        (let* ((lp (* pi -0.5))
               (rp (+ lp (* 2 pi)))
               (hf (lambda (i) (+ (* (sin i) 0.5) 0.5))))
          (map hf (indxs n lp rp)))))
     (square (lambda (x) (* x x)))
     (amp-table (map square (hanning-window tbl-sz)))
     (amp-f (lambda (i) (* (expt 0.5 i) 20000)))
     (freq-table (map amp-f (indxs tbl-sz 0 10)))
     (rate-scale (/ (/ tbl-sz 48000) 10)) ; sample-rate
     (rate 0.1)
     (ph (phasor ar 0 (* rate rate-scale) 0 tbl-sz 0))
     (phases (make-mce
              (map
               (lambda (n) (add (mul3 n 0.1 tbl-sz) ph))
               (enum-from-to 0 9))))
     (freqs (buf-rd-c 1 ar (as-local-buf freq-table) phases 1))
     (amps (buf-rd-c 1 ar (as-local-buf amp-table) phases 1)))
  (mul (mix (mul (sin-osc ar freqs 0) amps)) 0.1))