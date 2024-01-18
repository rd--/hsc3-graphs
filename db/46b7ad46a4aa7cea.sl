{- SamplerIndex ; event control ; stereo ; requires loaded bosendorfer (or equivalent) sample data -}
let b0 = 0;
Voicer(1, 16) { :e |
	let seq = [
		21 23 24 26 28 29 31 33 35 36 38 40 41 43 45 47 48 50 52 53 55 57 59
		60 62 64 65 67 69 71 72 74 76 77 79 81 83 84 86 88 89 91 93 95 96 98
		100 101 103 105 107 108
	];
	let tbl = seq.asLocalBuf;
	let mnn = e.x * 88 + 21;
	let mnn0 = Latch(mnn, e.w);
	let rt = ((mnn - mnn0) * e.y).MidiRatio;
	let [idx, rtMul] = SamplerIndex(tbl, BufFrames(tbl), mnn0);
	let b1 = b0 + idx;
	let sig = PlayBuf(2, b1, BufRateScale(b1) * rtMul * rt, e.w, 0, 0, 0);
	sig * e.z * e.w.LagUd(0, 4)
}.Sum
