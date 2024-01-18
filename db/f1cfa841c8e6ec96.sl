{- Phasor ; https://scsynth.org/t/8528/2 -}
let raisedCos = { :phase :index |
	let cosine = (phase * 2.pi).Cos;
	(index.Abs * (cosine - 1)).Exp
};
let rate = 110;
let modRatio = 2.5;
let index = SinOsc(0.3, 0).LinLin(-1, 1, 0, 30);
let modPhase = Phasor(Dc(0), rate * modRatio * SampleDur(), 0, 1, 0);
let mod = (modPhase * 2.pi).Sin;
let raisedCosWindow = raisedCos(modPhase, index);
let carPhase = Phasor(Dc(0), rate * SampleDur(), 0, 1, 0);
let car = (carPhase * 2.pi + (mod * index)).Sin;
let sig = car * raisedCosWindow;
LeakDc(sig, 0.995) * 0.1
