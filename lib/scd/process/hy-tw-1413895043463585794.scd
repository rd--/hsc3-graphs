// https://twitter.com/hrhkymd/status/1413895043463585794
{
	{
		var n = (0 .. 11).scramble.keep(2) + 60;
		var h = n[0];
		var j = n[1];
		[h, j, (h - j).abs].postln;
		if([1, 5, 6].includes((h - j).abs).not) {
			[h, j].do { arg m; { SinOsc.ar([m, m - 7].midicps, 0) ! 2 * Linen.kr(Trig.kr(1, 0.1), 5.0.rand, 0.1, 3, 2) }.play };
		};
		5.wait
	}.loop
}.fork

//---- https://twitter.com/hrhkymd/status/1413895043463585794
fork{loop{play{n=(..11).scramble.keep(2)+60;if([-1,1,-5,5,-6,6].includes(n[0]-n[1]),{h=j=0},{h=n[0];j=n[1]});ar(SinOsc,[h,h-7].midicps,0,kr(Linen,kr(Trig,1),5.0.rand,0.1,3,2))!2};play{ar(SinOsc,[j,j-7].midicps,0,kr(Linen,kr(Trig,1),5.0.rand,0.1,3,2))!2};5.wait}}//#SuperCollider
