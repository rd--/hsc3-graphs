{- https://gist.github.com/audionerd/fe50790b7601cba65ddd855caffb05ad (Eric Skogen) -}
let detune = MouseX(0.5, 2, 0, 0.2);
let detuneCurve = { :x |
	(10028.7312891634 * (x ^ 11)) -
	(50818.8652045924 * (x ^ 10)) +
	(111363.4808729368 * (x ^ 9)) -
	(138150.6761080548 * (x ^ 8)) +
	(106649.6679158292 * (x ^ 7)) -
	(53046.9642751875 * (x ^ 6)) +
	(17019.9518580080 * (x ^ 5)) -
	(3425.0836591318 * (x ^ 4)) +
	(404.2703938388 * (x ^ 3)) -
	(24.1878824391 * (x ^ 2)) +
	(0.6717417634 * x) +
	0.0030115596
};
Voicer(1, 16) { :e |
	let freq = (e.x * 24 + 36).MidiCps;
	let mix = e.y;
	let centerGain = { :x |
		(-0.55366 * x) + 0.99785
	};
	let sideGain = { :x |
		(-0.73764 * (x ^ 2)) + (1.2841 * x) + 0.044372
	};
	let center = LfSaw(freq, Rand(0, 1));
	let freqs = [
		(freq - (freq * (detuneCurve(detune)) * 0.11002313)),
		(freq - (freq * (detuneCurve(detune)) * 0.06288439)),
		(freq - (freq * (detuneCurve(detune)) * 0.01952356)),
		(freq + (freq * (detuneCurve(detune)) * 0.01991221)),
		(freq + (freq * (detuneCurve(detune)) * 0.06216538)),
		(freq + (freq * (detuneCurve(detune)) * 0.10745242))
	];
	let side = (1 .. 6).collect { :n |
		LfSaw(freqs[n], Rand(0, 2))
	}.Sum;
	let sig = (center * centerGain(mix)) + (side * sideGain(mix));
	let amp = e.z * 0.2 * e.w.LagUd(0.05, 2);
	Pan2(Hpf(sig, freq), e.i * 2 - 1, amp)
}.Mix
