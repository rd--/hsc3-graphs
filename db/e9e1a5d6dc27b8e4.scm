; random sine waves (jmcc) #1
(overlapTextureGraph
 2 5 12
 (lambda (tr) (Pan2 (SinOsc (TRand 10 2000 tr) 0) (TRand -1 1 tr) 0.02)))
