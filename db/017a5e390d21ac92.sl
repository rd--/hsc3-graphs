;; multiple sines ; https://github.com/cianoc/supercollider_fragments
var speeds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] / 20;
var f0 = (MouseX(0, 36, 0, 0.2).RoundTo(7) + 24).MidiCps;
var harmonics = 16;
(1 .. harmonics).collect({ :partial |
	Pan2(SinOsc(f0 * partial, 0), 1.Rand2, SinOsc(speeds.atRandom, 0).Max(0))
}).sum / harmonics * 0.5
