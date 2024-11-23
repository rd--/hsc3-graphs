/* 2019-11-28_RESINICA.scd ; https://github.com/gosub/supercollider-explore */
let note = 60;
let semi = [4, 7, 11, 12];
let delayTimes = (note + ([0] ++ semi)).MidiCps.reciprocal;
let in = LeakDc(PinkNoise(), 0.995) ! 2 / 5 + AudioIn([1, 2]);
let cf = SinOsc(1 / 10, 0).LinLin(-1, 1, 50, 500);
let z = Bpf(in, cf, 1);
let cmb = { :x :i |
	CombL(x, 0.2, delayTimes[i], 1)
};
let c1 = cmb(z[1] + z[2], 1);
let c2 = cmb(z[1], 2);
let c3 = cmb(z[2], 3);
let c4 = cmb(z[1], 4);
let c5 = cmb(z[2], 5);
let sumL = (c1 / 2 + c2 + c4) * -10.DbAmp;
let sumR = (c1 / 2 + c3 + c5) * -10.DbAmp;
Splay([sumL, sumR], 0.5)
