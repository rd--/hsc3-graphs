// LPF ; https://scsynth.org/t/5208/7 ; at very low frequencies LPF acts strangely
var impulseFreq = 3;
var lfo = LFPulse.ar(impulseFreq, 0, 0.5);
var freq = LinExp.kr(MouseX.kr(0, 1, 0, 0.2), 0, 1, impulseFreq, 20000);
SinOsc.ar(200 + (LPF.ar(lfo, freq) * 200), 0) * 0.1
