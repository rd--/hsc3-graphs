// slow beating harmonic sines (jmcc) #7 ; simpler
{
	var n = 8; // number of notes
	var d = 0.4; // beat frequency deviation
	var m = 5; // harmonics per note
	var p = OrderedCollection.new;
	var q = OrderedCollection.new;
	var k = 24 + 12.rand;
	n.do {
		var freq = (#[0, 2, 4, 5, 7, 9].choose + (7.rand * 12) + k).midiCps;
		[p, q].do {
			arg each;
			[1, 2, 4, 5, 6].do {
				arg h;
				each.add(freq * h + d.rand2)
			}
		}
	};
	[p, q].collect({
		arg freq;
		SinOscBank.ar(freq, 0.1, { 2 * pi.rand } ! (m * n))
	}) / n
}.xfade(6, 3)

// slow beating harmonic sines (jmcc) #7
{
	var n = 8; // number of notes
	var d = 0.4; // beat frequency deviation
	var m = 5; // harmonics per note
	var p = OrderedCollection.new;
	var q = OrderedCollection.new;
	var k = 24 + 12.rand;
	n.do({
		var freq = (#[0, 2, 4, 5, 7, 9].choose + (7.rand * 12) + k).midiCps;
		p.add(freq + d.rand2);
		p.add(freq * 2 + d.rand2);
		p.add(freq * 4 + d.rand2);
		p.add(freq * 5 + d.rand2);
		p.add(freq * 6 + d.rand2)
	});
	n.do({
		arg i;
		var freq = p.at(m * i);
		q.add(freq + d.rand2);
		q.add(freq * 2 + d.rand2);
		q.add(freq * 4 + d.rand2);
		q.add(freq * 5 + d.rand2);
		q.add(freq * 6 + d.rand2)
	});
	[p, q].collect({
		arg freq;
		SinOscBank.ar(freq, nil, { 2 * pi.rand } ! (m * n))
	}) * 0.1 / n
}.xfade(6, 3)
