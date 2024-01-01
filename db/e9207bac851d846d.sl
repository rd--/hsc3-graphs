var mul = MouseX(1, 9, 0, 0.2).RoundTo(1);
var rate = MouseY(1, 9, 0, 0.2) / mul;
var phase = Phasor(Impulse(rate, 0), rate * SampleDur(), 0, 1, 0);
var mnn = [phase, (phase * mul).Frac] * [12, -12] + [48, 72];
SinOsc(mnn.MidiCps, 0) * 0.1
