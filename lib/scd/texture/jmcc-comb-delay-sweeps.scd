// comb delay sweeps (jmcc) #6
{
	var dur = 4;
	var note1 = 50 + 70.rand;
	var endNote1 = (note1 + 15.rand - 7).fold(50, 120);
	var note2 = (note1 + 15.rand - 7).fold(50, 120);
	var endNote2 = (endNote1 + 15.rand - 7).fold(50, 120);
	var noteSweep = Ln.kr(note2, endNote2, dur);
	var dt = 1 / noteSweep.midicps;
	var dc = 1 / note2.midicps * 1000;
	Pan2.ar(CombC.ar(WhiteNoise.ar * 0.005, 0.01, dt, dc), 1.0.rand2)
}.overlap(4 / 3, 4 / 3, 6)
