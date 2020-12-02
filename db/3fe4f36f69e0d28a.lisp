; median ; filter for high frequency noise & leak-dc for low frequency noise
(let* ((s0 (mul-add (white-noise ar) 0.05 (mul (sin-osc ar 800 0) 0.1)))
       (s1 (median 31 s0)))
  (leak-dc s1 0.9))
