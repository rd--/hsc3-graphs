-- rMShelf2 ; freq=mouse-x
let freq = mouseX KR 55 3520 Exponential 0.2
in X.rMShelf2 AR (whiteNoise 'α' AR * 0.1) freq 0
