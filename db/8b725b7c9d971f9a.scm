; removeSynth ; c.f. FreeSelfWhenDone
(let* ((x (MouseX -1 1 0 0.1))
       (e (Linen x 1 0.1 1 removeSynth)))
  (Mul (SinOsc 440 0) e))
