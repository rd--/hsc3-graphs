-- warp1 ; requires=buf
let b = control KR "buf" 0
    p = linLin (lfSaw KR 0.05 0) (-1) 1 0 1
    x = mouseX KR 0.5 2 Linear 0.1
in warp1 1 b p x 0.1 (-1) 8 0.1 2
