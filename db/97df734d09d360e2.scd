// shepard-tones (adc)
var ampTable = Signal.hanningWindow(1024).squared;
var ampFunc = { | i |
	0.5 ** i * 20000
};
var freqTable = Signal.newClear(1024).waveFill(ampFunc, 0, 10);
var b1 = Buffer.loadCollection(s, freqTable);
var b2 = Buffer.loadCollection(s, ampTable);
var rateScale = 1024 / 44100 / 10;
var rate = 0.1;
var ph = Phasor.ar(0, rate * rateScale, 0, 1024, 0);
var phases = (0 .. 9) * 0.1 * 1024 + ph;
var freqs = BufRd.ar(1, b1.bufnum, phases);
var amps = BufRd.ar(1, b2.bufnum, phases);
Mix.ar(SinOsc.ar(freqs) * amps) * 0.1
