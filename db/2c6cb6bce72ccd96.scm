; Latch ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029991.html>
(let* ((n0 (MulAdd (LfNoise2 8) 200 300))
       (n1 (MulAdd (LfNoise2 3) 10 20))
       (s (Mul (Blip n0 n1) 0.1))
       (x (MouseX 1000 (Mul (SampleRate) 0.1) 1 0.1)))
  (Latch s (Impulse x 0)))
