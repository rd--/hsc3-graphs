// alien froggies (jmcc) #1
{
	var r = (11 * 0.2.bilinrand.exp).fold(1, 30);
	Formant.ar(r, 200.exprand(3000), 9.0.rand * r + r) * 0.05;
}.overlap(0.5, 0.25, 5)

// alien froggies (jmcc) #1 ; language random ; keywords
{
		var rate = 11;
		var r = (rate * 0.2.bilinrand.exp).fold(1, 30);
		Formant.ar(
			fundfreq: r,
			formfreq: 200.exprand(3000),
			bwfreq: 9.0.rand * r + r
		) * 0.05;
}.overlap(
	sustainTime: 0.5,
	transitionTime: 0.25,
	overlap: 5
)
