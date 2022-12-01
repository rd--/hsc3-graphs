// slow beating sines (jmcc) #7 - ritual hymn in praise of the god of the LS-3000 life support unit
{
	var n = 20; // n * 3 components in each channel
	var d = 5.0; // beating frequency deviation
	var p = OrderedCollection.new;
	var q = OrderedCollection.new;
	var z = nil;
	n.do({
		var freq = (24 + 60.rand).midiCps;
		p.add(freq);
		p.add(freq + d.rand2);
		p.add(freq + d.rand2)
	});
	n.do({
		arg i;
		var freq = p.at(3 * i);
		q.add(freq + d.rand2);
		q.add(freq + d.rand2);
		q.add(freq + d.rand2)
	});
	[p, q].collect({
		arg f;
		SinOscBank.ar(f, nil, { 2 * pi.rand }.dup(3 * n))
	}) / n / 4
}.xfade(4, 4)
