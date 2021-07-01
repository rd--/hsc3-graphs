-- rmShelf2 ; k=mouse-y
let freq = mouseX kr 55 3520 Exponential 0.2
    k = mouseY kr (-12) 12 Linear 0.2
in X.rmShelf2 ar (whiteNoiseId 'α' ar * 0.1) freq k * 0.1
