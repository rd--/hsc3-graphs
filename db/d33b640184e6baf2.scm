; EnvGen
(let* ((d (envPerc 0.01 1 1 (list -4 -4)))
       (t (Impulse kr (LinLin (LFNoise2 kr 3) -1 1 1 9) 0))
       (e (EnvGen kr t 0.1 0 1 doNothing d)))
 (Mul e (SinOsc ar (TRand 220 440 t) 0)))
