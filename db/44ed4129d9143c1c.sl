(* Lpf ; https://scsynth.org/t/5208/7 ; at very low frequencies Lpf acts strangely *)
let impulseFreq = 3;
let lfo = LfPulse(impulseFreq, 0, 0.5);
let freq = LinExp(MouseX(0, 1, 0, 0.2), 0, 1, impulseFreq, 20000);
SinOsc(200 + (Lpf(lfo, freq) * 200), 0) * 0.1
