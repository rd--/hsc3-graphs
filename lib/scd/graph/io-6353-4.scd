// https://scsynth.org/t/6353/4 ; io ; https://ingoogni.nl/
var shuheiKawachi = {
	arg x, y, a, b;
	((x.cos * y.cos)
		+ (((a.sqrt * x - y) / b).cos
			* ((x + (a.sqrt * y) ) / b).cos)
			+ ((( a.sqrt * x + y) / b).cos
				* ((x - (a.sqrt * y*y)) / b).cos)) / 3;
			};
			var segments = 49;
			var xMajor = 10;
			var yMajor = 1;
			var rMajor = 100.1;
			var rMinor = 1.1;
			var circlefreq = 0.0001;
			var xMinor = xMajor + (rMajor * SinOsc.ar(circlefreq, 0));
			var yMinor = yMajor + (rMajor * SinOsc.ar(circlefreq, pi / 2));
			var freqArray = { 50.exprand(1500) }.dup(segments).sort;
			var oscArray = (0 .. segments - 1).collect({
				arg index;
				var x = xMinor + (rMinor * (index * 2 * pi / segments).sin);
				var y = yMinor + (rMinor * (index * 2 * pi / segments).cos);
				var amp = shuheiKawachi.value(x, y, 2 * pi, 0.5).abs / 12;
				SinOsc.ar(freqArray[index], 0) * amp
			});
			Splay.ar(oscArray) * 5
