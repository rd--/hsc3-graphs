/* Random pulsations (Jmcc) #1 ; Graph rewrite */
{ :tr |
	let o1 = SinOsc(TRand(0, 2000, tr), 0);
	let o2 = SinOsc(8 + TRand(0, 80, tr), 0);
	let o3 = SinOsc(0.3 + TRand(0, 0.5, tr), TRand(0, 2.pi, tr)) * 0.7;
	EqPan2(o1.AmClip(o2), o3) * 0.05
}.OverlapTexture(5, 2, 6).Mix
