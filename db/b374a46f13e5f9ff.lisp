; latch ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029991.html>
(let* ((n0 (mul-add (lf-noise2 kr 8) 200 300))
       (n1 (mul-add (lf-noise2 kr 3) 10 20))
       (s (mul (blip ar n0 n1) 0.1))
       (x (mouse-x kr 1000 (mul sample-rate 0.1) 1 0.1)))
  (latch s (impulse ar x 0)))
