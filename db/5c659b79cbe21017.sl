(* Phasor ; https://scsynth.org/t/8528/2 *)
var raisedCos = { :phase :index |
	var cosine = (phase * 2.pi).Cos;
	(index.Abs * (cosine - 1)).Exp
};
var rate = 110;
var modRatio = 2.5;
var index = SinOsc(0.3, 0).LinLin(-1, 1, 0, 30);
var modPhase = Phasor(Dc(0), rate * modRatio * SampleDur(), 0, 1, 0);
var mod = (modPhase * 2.pi).Sin;
var raisedCosWindow = raisedCos(modPhase, index);
var carPhase = Phasor(Dc(0), rate * SampleDur(), 0, 1, 0);
var car = (carPhase * 2.pi + (mod * index)).Sin;
var sig = car * raisedCosWindow;
LeakDc(sig, 0.995) * 0.1
