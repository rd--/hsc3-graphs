; random sine waves (jmcc) #1
(u:overlap-texture
 2 5 12
 (lambda (tr) (pan2 (sin-osc ar (t-rand 10 2000 tr) 0) (t-rand -1 1 tr) 0.02)))
