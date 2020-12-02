-- rMShelf2 ; k=mouse-y
let freq = mouseX KR 55 3520 Exponential 0.2
    k = mouseY KR (-12) 12 Linear 0.2
in X.rMShelf2 AR (whiteNoise 'α' AR * 0.1) freq k * 0.1
