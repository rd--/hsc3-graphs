let k = 2;
let usePen = false;
let x = usePen.if { PenX(1) * 2 - 1 } { MouseX(-1, 1, 0, 0.2) };
let y = usePen.if { PenY(1) * 2 - 1 } { MouseY(-1, 1, 0, 0.2) };
let c = [-45, 45, 135, -135].collect { :each |
	[1, each.degreesToRadians, pi / 2].fromSphericalCoordinates
}.++;
let n = KNearest(k, x, y, 0, c);
let z = [
	SinOsc(333, 0),
	PinkNoise(),
	Saw(111) / 2,
	Pulse(555, 0.5) / 3
] * 0.1;
Select(n, z)
