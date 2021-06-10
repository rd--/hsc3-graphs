; Pow ; <http://create.ucsb.edu/pipermail/sc-users/2006-December/029998.html>
(let* ((n0 (MulAdd (LFNoise2 kr 8) 200 300))
       (n1 (MulAdd (LFNoise2 kr 3) 10 20))
       (s (Blip ar n0 n1))
       (x (MouseX kr 1000 (Mul SampleRate 0.5) 1 0.1))
       (y (MouseY kr 1 24 1 0.1))
       (d (Latch s (Impulse ar x 0))))
  (Mul (Mce2 d (Round d (Pow 0.5 y))) 0.1))
