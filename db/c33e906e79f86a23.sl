var usePen = false;
var x = usePen.if { PenX(1) * 2 - 1 } { MouseX(-1, 1, 0, 0.2) };
var y = usePen.if { PenY(1) * 2 - 1 } { MouseY(-1, 1, 0, 0.2) };
var c = [-45, 45, 135, -135].collect { :each |
	SphericalCoordinate(1, each.degreesToRadians, pi / 2).asCartesianCoordinate.asArray
}.concatenation;
var g = 0.5 / Distances(x, y, 0, c);
var z = Hpf(PinkNoise(), ([1 .. 4] * 12 + 36).MidiCps);
(z * g).Splay
