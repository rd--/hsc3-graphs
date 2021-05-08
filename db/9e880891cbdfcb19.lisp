; random sine waves (jmcc) #1
(u:overlap-texture
 2 5 12
 (lambda (tr) (Pan2 (SinOsc ar (TRand 10 2000 tr) 0) (TRand -1 1 tr) 0.02)))
