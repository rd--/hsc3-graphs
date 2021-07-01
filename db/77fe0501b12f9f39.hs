-- rmShelf2 ; freq=mouse-x
let freq = mouseX kr 55 3520 Exponential 0.2
in X.rmShelf2 ar (whiteNoiseId 'α' ar * 0.1) freq 0
