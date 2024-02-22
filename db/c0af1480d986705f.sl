{- Pluck ; event control ; requires=record/voicer -}
(
	w: SinOsc(Rand(2:9 / 11, 1), 0),
	x: LfNoise2(Rand(2:9.reversed / 13, 1)).LinLin(-1, 1, 0, 2:9 / 17),
	y: LfNoise2(Rand(2:9 / 15, 2)).LinLin(-1, 1, 2:9.reversed / 19, 1),
	z: LfNoise2(Rand(1, 2:9.reversed / 11)).LinLin(-1, 1, 0, 2:9 / 9)
).Voicer { :e |
	let dm = 1 / 220;
	let dl = (e.x.negated * 0.9 + 1) * dm;
	let sig = Pluck(WhiteNoise() * e.z, e.w, dm, dl, 10, e.y / 3);
	EqPan2(sig, e.y * 2 - 1) * 0.25
}.Mix
