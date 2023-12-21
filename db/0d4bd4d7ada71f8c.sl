(* tremulate (jmcc) ; event control ; requires=voicer *)
var s = Voicer(16) { :e |
	var s = SinOsc(e.x * 400 + 500 * [1 1.2 1.5 1.8], 0); (* just minor seventh chord, 1:1 5:4 3:2 9:5 *)
	var a = LfNoise2({ Rand(30, 90) } ! 4 * (0.75 + e.j)).Max(0) * e.z;
	Pan2(s, { Rand(-1, 1) } ! 4 + (e.i * 2 - 1), a * LagUd(e.w, 0, e.k * 2)).Sum
}.Mix * 0.5;
CombN(s, 0.1, 0.1, 1)
