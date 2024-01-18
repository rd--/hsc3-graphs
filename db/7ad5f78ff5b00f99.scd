// https://scsynth.org/t/6353-1 ; io ; https://ingoogni.nl/
var shuheiKawachi = {
	arg x, y, a, b;
	((x.cos * y.cos)
		+ (((a.sqrt * x - y) / b).cos
			* ((x + (a.sqrt * y) ) / b).cos)
		+ ((( a.sqrt * x + y) / b).cos
			* ((x - (a.sqrt * y*y)) / b).cos)); // / 3
};
var segments = 50;
var xMajor = 0;
var yMajor = 10;
var rMajor = 30.1;
var rMinor = 0.1;
var circlefreq = 0.0001;
var xMinor = xMajor + (rMajor * SinOsc.ar(circlefreq, 0));
var yMinor = yMajor + (rMajor * SinOsc.ar(circlefreq, pi / 2));
var freqArray = { 50.exprand(1500) }.dup(segments).sort;
var oscArray = (0 .. segments - 1).collect({
	arg index;
	var x = xMinor + (rMinor * (index * 2 * pi / segments).sin);
	var y = yMinor + (rMinor * (index * 2 * pi / segments).cos);
	var grey = shuheiKawachi.value(x, y, 2 * pi, 0.5);
	var amp = Wrap.ar(grey, 0, 1).lag(0.01) / segments;
	SinOsc.ar(freqArray[index], 0) * amp
});
var sumToMono = false;
sumToMono.if {
	Pan2(oscArray.sum, 0, 1)
} {
	Splay.ar(oscArray) * 9
}
