-- pan2
let n = pinkNoiseId 'α' ar * 0.1
    x = mouseX kr (-1) 1 Linear 0.2
    y = mouseY kr 0 1 Linear 0.2
in pan2 n x y
