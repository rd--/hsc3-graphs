(* MiClouds ; requires=keywords ; requires>#14 *)
let pit = LfNoise1(0.3) * 12;
let pos = LfNoise2(0.4) * 0.5 + 0.5;
let size = LfNoise1(0.3) * 0.5 + 0.5;
let dens = LfNoise1(0.3) * 0.5 + 0.5;
let tex = LfNoise1(0.3) * 0.5 + 0.5;
let freeze = LfClipNoise(0.3);
let tr = Dust([0.8, 1.1]);
let freq = Latch(PinkNoise() * 24 + 80, tr).MidiCps;
let inputArray = Rlpf(tr, freq, 0.002) * 4;
MiClouds(
	pit: pit,
	pos: pos,
	size: size,
	dens: dens,
	tex: tex,
	dryWet: 0.5,
	inGain: 2,
	spread: 0.5,
	rvb: 0.3,
	fb: 0.8,
	freeze: freeze,
	mode: 0,
	lofi: 1,
	trig: 0,
	inputArray: inputArray
)
