;; ring modulate & echo input ; jmcc #5 ; requires=AudioIn
var in = AudioIn([1, 2]) * 0.4 * SinOsc(MouseX(10, 2000, 1, 0.2), [0, 0.5 * pi]);
CombL(in, 0.5, MouseY(0, 0.5, 0, 0.2), 4) + in
