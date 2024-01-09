// https://gist.github.com/audionerd/fe50790b7601cba65ddd855caffb05ad (Eric Skogen)
var detune = MouseX.kr(0.5, 2, 0, 0.2);
var detuneCurve = { |x|
    (10028.7312891634 * x.pow(11)) -
    (50818.8652045924 * x.pow(10)) +
    (111363.4808729368 * x.pow(9)) -
    (138150.6761080548 * x.pow(8)) +
    (106649.6679158292 * x.pow(7)) -
    (53046.9642751875 * x.pow(6)) +
    (17019.9518580080 * x.pow(5)) -
    (3425.0836591318 * x.pow(4)) +
    (404.2703938388 * x.pow(3)) -
    (24.1878824391 * x.pow(2)) +
    (0.6717417634 * x) +
    0.0030115596
};
var evt = Voicer.ar(
	0,
	16,
	{ |e|
		var freq = (e.x * 24 + 36).midicps;
		var mix = e.y;
		var centerGain = { |x|
			(-0.55366 * x) + 0.99785
		};
		var sideGain = { |x|
			(-0.73764 * x.pow(2)) + (1.2841 * x) + 0.044372
		};
		var center = LFSaw.ar(freq, Rand.ir(0, 1));
		var freqs = [
			(freq - (freq * (detuneCurve.value(detune)) * 0.11002313)),
			(freq - (freq * (detuneCurve.value(detune)) * 0.06288439)),
			(freq - (freq * (detuneCurve.value(detune)) * 0.01952356)),
			(freq + (freq * (detuneCurve.value(detune)) * 0.01991221)),
			(freq + (freq * (detuneCurve.value(detune)) * 0.06216538)),
			(freq + (freq * (detuneCurve.value(detune)) * 0.10745242))
		];
		var side = Mix.fill(6, { |n|
			LFSaw.ar(freqs.at(n), Rand.ir(0, 2))
		});
		var sig = (center * centerGain.value(mix)) + (side * sideGain.value(mix));
		var amp = e.z * 0.2 * LagUD.kr(e.w, 0.05, 2);
		Pan2.ar(HPF.ar(sig, freq), e.i * 2 - 1, amp)
	}
);
Mix.ar(evt)
