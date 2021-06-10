; freeselfwhendone
(let* ((x (MouseX kr -1 1 0 0.1))
       (e (Linen x 2 0.1 2 doNothing)))
 (Mrg2 (Mul (SinOsc ar 440 0) e) (FreeSelfWhenDone e)))
