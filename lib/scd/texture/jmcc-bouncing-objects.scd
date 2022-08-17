// bouncing objects (jmcc) #2
{
	var impFreq = XLine.kr(5 + 2.0.rand2, 600, 4);
	var impAmp = XLine.kr(0.09, 0.000009, 4);
	var imp = Impulse.ar(impFreq, 0) * impAmp;
	var exc = Decay.ar(imp, 0.001);
	var fltFreq = Array.fill(4, {400 + 8000.0.rand});
	var fltAmp = Array.fill(4, {1.0.rand});
	var fltRtm = Array.fill(4, {0.01 + 0.1.rand});
	var flt = Klank.ar(`[fltFreq, fltAmp, fltRtm], exc);
	var loc = Pan2.ar(flt, 1.0.rand2);
	var e = Env([1, 1, 0], [3, 0.001]);
	loc * EnvGen.kr(e,doneAction:2)
}.spawn({ 0.6 + 0.6.rand })
