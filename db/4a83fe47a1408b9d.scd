// f0 - c.f. arrayed inputs
{
	var freq = #[174.61,196.00,130.81], pan = 0.0, atk = 0.1, sus = 0.5, rls = 2.0, gate = 1, arpDur = 0.25;
	var env = EnvGen.ar(Env.linen(atk, sus, rls), DelayN.kr(gate, arpDur, [0, 0.5, 1] * arpDur));
	var sig = GVerb.ar(Mix.ar(SinOsc.ar(freq) * env), 150, 5) * 0.1;
	Pan2.ar(sig, pan) <! DetectSilence.ar(sig, doneAction:2)
}
