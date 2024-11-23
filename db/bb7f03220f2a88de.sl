/* DelayMap - one second delay at quarter gain */
let b = LocalBuf(1, 2 * 48000).ZeroBuf;
let a = [
	-1 0 0 0.5
	1 -1 0 1
];
let x = MouseX(110, 440, 0, 0.1);
let y = MouseY(0.0, 0.2, 0, 0.1);
let o = SinOsc(x, 0) * y;
[DelayMap(b, o, 0, a), o]
