/* SfPlay ; floating dust (adc) ; https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00736.html ; panning edit (rd) */
let sf = SfAcquireMono('Floating');
0:9.collect { :n |
	let r = 0.1 ^ (n - 1);
	0:n.collect { :i |
		let a = (n - 2 < i).if {
			0.5
		} {
			0.1 ^ (n * 0.9 - 3.5 - i)
		};
		r := SfPlay(sf, r, 1, 0, 1) * a
	};
	EqPan2(r, Rand(-1, 1))
}.Mix
