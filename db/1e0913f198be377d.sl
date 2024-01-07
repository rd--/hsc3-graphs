(* 20060919 ; rd *)
let fw = { :r |
	let t = Dust(3);
	let r1 = TiRand(0, 6, t);
	let r2 = TRand(-0.0001, 0.0001, t);
	let b0 = [
		40 47 42 40 50
		43 35 43 40 47
		45 35 43 42 59
		48 40 47 52 45
	].asLocalBuf;
	let b1 = [
		40, 40, 42, 47, 50,
		35, 43, 43, 40, 45,
		42, 35, 48, 47, 43,
		40, 59, 45, 47, 52
	].asLocalBuf;
	let f = BufRd(1, [b0, b1], r1, 0, 2);
	let o1 = Blip((r + f).MidiCps, 12);
	let o2 = Blip((r + f + r2).MidiCps, 12);
	o1 + o2 * Decay2(t, 0.3, 1.2) * 0.1
};
fw(24) + fw(36)
