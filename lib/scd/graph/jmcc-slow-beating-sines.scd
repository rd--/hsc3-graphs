// slow beating sines (jmcc) #7 ; texture=xfade,4,4,inf
var n = 20; // n * 3 components in each channel
var d = 5.0; // beating frequency deviation
var p = Array.new(3 * n);
var q = Array.new(3 * n);
var z = nil;
n.do({
	var freq = (24 + Rand.ir(0,60)).midicps;
	p.add(freq);
	p.add(freq + Rand.ir(d.neg,d));
	p.add(freq + Rand.ir(d.neg,d))
});
n.do({ |i|
	var freq = p.at(3 * i);
	q.add(freq + Rand.ir(d.neg,d));
	q.add(freq + Rand.ir(d.neg,d));
	q.add(freq + Rand.ir(d.neg,d))
});
z = [
	Ref.new([p, nil, RandN.ir(3 * n, 0, 2 * pi)]),
	Ref.new([q, nil, RandN.ir(3 * n, 0, 2 * pi)])
];
Klang.ar(z) * (0.1 / n)
