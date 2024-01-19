// autotune (jrhb) https://www.listarc.bham.ac.uk/lists/sc-users-2019/msg63759.html
{
	var scale = ([0, 1, 3, 4, 7, 11, 12] + 70).midicps;
	var buffer = scale.as(LocalBuf);
	var in = Pulse.ar(MouseX.kr(scale.minItem, scale.maxItem)) * 0.1;
	var f0 = Pitch.kr(in).at(0);
	var index = IndexInBetween.kr(buffer, f0);
	var fdiff = index.frac * (Index.kr(buffer, index + 1) - Index.kr(buffer, index));
	var autotuned = PitchShift.ar(in, 0.1, 1 - (fdiff / f0), 0.01, 0.01);
	RLPF.ar(autotuned, [2000, 5000], 0.3)
}
