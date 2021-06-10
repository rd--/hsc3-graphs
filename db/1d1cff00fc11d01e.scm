; radianspersample ; written out
(let* ((sr 48000) (sd 1/48000) (rps (* sd twoPi)))
  (Mul (SinOsc ar (FDiv (Recip rps) twoPi) 0) 0.05))
