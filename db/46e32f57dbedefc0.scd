/* https://twitter.com/mclduk/status/1401081491 */
var x = Line.kr(0, [0.9, 1], 30);
5.do {
	x = [Saw, SinOsc, Pulse].choose.ar(x.range(10, 1000))
};
x * 0.1
