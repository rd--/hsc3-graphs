; radianspersample ; written out
(let* ((sr 48000) (sd (/ 1 48000)) (rps (* sd two-pi)))
  (Mul (SinOsc ar (FDiv (Recip rps) two-pi) 0) 0.05))
