{- Prepared just piano ; Colby Leider ; modified by Jmcc ; Graph rewrite (rd) -}
let c = 4; {- Number of combs -}
let a = 4; {- Number of allpasses -}
let v = 3; {- Number of overlapped voices -}
let d = MouseY(0, 1, 0, 0.2) > 0.5; {- Is pitch space discrete or continuous -}
{ :tr |
	let y = Dust(MouseX(0.1, 4, 1, 0.2)) * 0.4;
	y := Resonz(y, 400, 0.4);
	y := Lpf(y, 12000);
	y := Integrator(y, 0.99);
	y := Hpf(y, 200);
	y := {
		{- Partch tonality diamond about 1000Hz -}
		CombL(
			y,
			0.1,
			TRand(1, 8, tr).RoundTo(d) / TRand(1, 9, tr).RoundTo(d) * 0.001,
			5
		)
	} !+ c;
	a.timesRepeat {
		y := AllpassN(y, 0.040, { TRand(0, 0.040, tr) } ! 2, 8)
	};
	y
}.OverlapTexture(5, 3, v).Mix
