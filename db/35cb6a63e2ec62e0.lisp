; pow ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029998.html>
(let* ((n0 (mul-add (lf-noise2 kr 8) 200 300))
       (n1 (mul-add (lf-noise2 kr 3) 10 20))
       (s (blip ar n0 n1))
       (x (mouse-x kr 1000 (mul sample-rate 0.5) 1 0.1))
       (y (mouse-y kr 1 24 1 0.1))
       (d (latch s (impulse ar x 0))))
  (mul (mce2 d (u:round d (pow 0.5 y))) 0.1))
