/* Narrow band filtered crackle noise (Jmcc) #2 ; Graph rewrite */
{ :tr |
	let rf1 = TRand(0, 2000, tr) + 80;
	let rf2 = rf1 + (TRand(-0.2, 0.2, tr) * rf1);
	let rf = TxLine(rf1, rf2, 9, tr);
	let c = Crackle(1.97 + TRand(0, 0.03, tr));
	EqPan2(Resonz(c, rf, 0.2), TRand(-1, 1, tr))
}.OverlapTexture(2, 5, 4).Mix * 0.15 /* C.f. 5, 2, 5 */
