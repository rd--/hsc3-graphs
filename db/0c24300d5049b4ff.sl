/* https://twitter.com/mclduk/status/1401081491 ; ds */
let x = Line(0, [0.9, 1], 30);
5.timesRepeat {
	let o:/1 = [
		{ :f | Saw(f) },
		{ :f | SinOsc(f, 0) },
		{ :f | Pulse(f, 0.5) }
	].atRandom;
	x := o(x.LinLin(-1, 1, 10, 1000))
};
x * 0.1
