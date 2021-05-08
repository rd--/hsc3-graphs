; Latch ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029991.html>
(let* ((n0 (MulAdd (LFNoise2 kr 8) 200 300))
       (n1 (MulAdd (LFNoise2 kr 3) 10 20))
       (s (Mul (Blip ar n0 n1) 0.1))
       (x (MouseX kr 1000 (Mul SampleRate 0.1) 1 0.1)))
  (Latch s (Impulse ar x 0)))
