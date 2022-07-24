; envPerc
(let* ((d (envPerc 0.01 1 1 (list -4 -4)))
       (e (EnvGen (Impulse 1 0) 0.1 0 1 doNothing d)))
 (Mul e (SinOsc 440 0)))
