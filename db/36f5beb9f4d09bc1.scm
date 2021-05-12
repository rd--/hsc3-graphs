; AmpComp ; compare sine with and withOut compensation
(let* ((x (MouseX kr 300 15000 1 0.1))
       (y (MouseY kr 0 1 0 0.1))
       (o (Mul (SinOsc ar x 0) 0.1))
       (c (AmpComp kr x 300 0.333)))
  (mce2 (Mul o y) (mul3 o (Sub 1 y) c)))
