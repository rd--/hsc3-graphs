// LPF ; event control
Mix.ar(
	Voicer.ar(16) { | e |
		var f0 = e.p.unitCps;
		Pan2.ar(
			LPF.ar(Blip.ar(f0, 1 + e.y * 5), f0 * 0.25),
			e.i * 2 - 1,
			LagUD.kr(e.w, 0.05, 1) * e.z * 4
		)
	}
)
