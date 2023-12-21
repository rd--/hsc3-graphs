-- warp1 ; requires=buf ; interp=2=linear ; nc=2
let (b, nc) = (control kr "buf" 100, 2)
    p = linLin (lfSaw kr 0.05 0) (-1) 1 0 1
    x = mouseX kr 0.5 2 Linear 0.1
in warp1 nc b p x 0.1 (-1) 8 0.1 2 * 0.5
