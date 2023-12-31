(* shepard tones ; adc *)
var ampTable = 1024.hanningWindow.squared.asLocalBuf;
var freqTable = (0 .. 1023).collect { :i |
	0.5 ^ (i / 1024 * 10) * 20000
}.asLocalBuf;
var rateScale = 1024 / 44100 / 10;
var rate = 0.1;
var ph = Phasor(0, rate * rateScale, 0, 1024, 0);
var phases = (0 .. 9) * 0.1 * 1024 + ph;
var freqs = BufRd(1, freqTable, phases, 1, 2);
var amps = BufRd(1, ampTable, phases, 1, 2);
(SinOsc(freqs, 0) * amps).sum * 0.1
