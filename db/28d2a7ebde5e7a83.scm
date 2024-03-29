; tsort (jmcc)
;
; This simple graph tests the topological sort of the unit generator
; graph, it ought only to use a minimal number of interconnect buffers.
;
; The above 369 node graph works with 'scsynth -u 57110 -w 2'.
;
; (Note that graphs loaded from disk during startup will grow the number
; of interconnect buffers, so to test this we must delete all graphs that
; would otherwise be loaded.)
(let* ((n 122)
       (c (EnvBreakPoint '(0 0.15 1 6 0) 1 1 '(1 1 1)))
       (e (EnvGen 1 1 0 1 removeSynth c))
       (f (lambda (o) (Mul (SinOsc (Add 440 o) 0) 0.001)))
       (s (mixFill n f)))
  (Mul s e))
