; narrow band filtered crackle noise (jmcc) #2 ; texture=spawn,2,inf
(let* ((e (EnvLinen 2 5 2 1 (list)))
       (rf1 (Add (Rand 0 2000) 80))
       (rf2 (Add rf1 (Mul (Rand2 0.2) rf1)))
       (rf (XLine rf1 rf2 9 doNothing))
       (c (Mul (Crackle (Add 1.97 (Rand 0 0.03))) 0.15)))
  (Pan2 (Resonz c rf 0.2) (Rand2 1) (EnvGen 1 1 0 1 removeSynth e)))
