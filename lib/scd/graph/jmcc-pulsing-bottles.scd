// Pulsing bottles (Jmcc) #2
var n = 6; // number of 'bottles'
var f = {
	var a = LFPulse.kr(4 + 10.0.rand, 0, 0.7.rand, 0.8 / n);
	var l = SinOsc.kr(0.1 + 0.4.rand, (2 * pi).rand);
	Pan2.ar(Resonz.ar(WhiteNoise.ar(a),400 + 7000.0.linrand,0.01),l)
};
Mix.fill(n,f)
