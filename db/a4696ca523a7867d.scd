// coolant (jmcc)
{
	var r = Ref([{40 + 2000.0.rand} ! 10, nil, nil]);
	{
		Klank.ar(r, OnePole.ar(BrownNoise.ar * 0.002, 0.95), 1, 0, 1)
	} ! 2
}
