-- pan2
let n = pinkNoise 'α' AR * 0.1
    x = mouseX KR (-1) 1 Linear 0.2
    y = mouseY KR 0 1 Linear 0.2
in pan2 n x y
