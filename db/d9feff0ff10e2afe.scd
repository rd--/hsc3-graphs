// f0 - https://www.listarc.bham.ac.uk/lists/sc-users/msg69041.html
{arg freq1=174.61, freq2=196.00, freq3=130.81, pan=0.0, atk=0.1, sus=0.5, rls=2.0, gate=1, arpDur=0.25
;var freq = [freq1, freq2, freq3]
;var env = EnvGen.ar(Env.linen(atk, sus, rls), DelayN.kr(gate, arpDur, [0, 0.5, 1] * arpDur))
;var sig = GVerb.ar(Mix(SinOsc.ar(freq) * env), 150, 5) * 0.1
;DetectSilence.ar(sig, doneAction:2)
;Pan2.ar(sig, pan)}