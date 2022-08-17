; Pow ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029998.html>
(let* ((n0 (MulAdd (LFNoise2 8) 200 300))
       (n1 (MulAdd (LFNoise2 3) 10 20))
       (s (Blip n0 n1))
       (x (MouseX 1000 (Mul (SampleRate) 0.5) 1 0.1))
       (y (MouseY 1 24 1 0.1))
       (d (Latch s (Impulse x 0))))
  (Mul (Mce2 d (RoundTo d (Pow 0.5 y))) 0.1))
