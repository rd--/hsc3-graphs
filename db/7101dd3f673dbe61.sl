let list = {
	Saw(Rand(1, 3)) * Saw(Rand(100, 3000))
} ! 8;
SelectXFocus(MouseX(-20, 20, 0, 0.2), list, 0.3, true) * 0.1
