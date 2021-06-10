; mce ; list inputs at ugen constructors are re-written asMce
(Splay (SinOsc ar (iterate 5 (lambda (x) (+ x 55)) 55) 0) 1 0.1 0 #t)
