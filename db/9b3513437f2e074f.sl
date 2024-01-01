var k = 2;
var usePen = false;
var x = usePen.if { PenX(1) * 2 - 1 } { MouseX(-1, 1, 0, 0.2) };
var y = usePen.if { PenY(1) * 2 - 1 } { MouseY(-1, 1, 0, 0.2) };
var c = [-45, 45, 135, -135].collect { :each |
	SphericalCoordinate(1, each.degreesToRadians, pi / 2).asCartesianCoordinate.asArray
}.concatenation;
var n = KNearest(k, x, y, 0, c);
var z = [
	SinOsc(333, 0),
	PinkNoise(),
	Saw(111) / 2,
	Pulse(555, 0.5) / 3
] * 0.1;
Select(n, z)
