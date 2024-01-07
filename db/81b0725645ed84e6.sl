let mul = MouseX(1, 9, 0, 0.2).RoundTo(1);
let rate = MouseY(1, 9, 0, 0.2) / mul;
let phase = Phasor(Impulse(rate, 0), rate * SampleDur(), 0, 1, 0);
let mnn = [phase, (phase * mul).Frac] * [12, -12] + [48, 72];
SinOsc(mnn.MidiCps, 0) * 0.1
