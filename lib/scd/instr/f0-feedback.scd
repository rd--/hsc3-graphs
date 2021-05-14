// http://www.fredrikolofsson.com/f0blog/?q=node/619
SynthDef(\feedback4, {
    arg freq = 400, amp = 0.1, fb = 2, del = 0.1, lfo = 1, rate = 2, cutoff = 500;
    var env = EnvGen.kr(Env.perc(1, 4), doneAction:2);
    var lin = DelayN.ar(HPF.ar(LocalIn.ar(1), cutoff), 1, del);
    var src = SinOsc.ar(freq+SinOsc.ar(rate, 0, lfo), lin*2pi*fb, amp)*env;
    LocalOut.ar(src);
    Out.ar(0, Pan2.ar(src));
}).add;

Synth(\feedback4)
Synth(\feedback4, [\del, 0.5])
Synth(\feedback4, [\del, 0.01, \cutoff, 100])
Synth(\feedback4, [\del, 0.01, \fb, 3, \cutoff, 100])
Synth(\feedback4, [\del, 0.01, \fb, 2, \lfo, 15, \cutoff, 100])
Synth(\feedback4, [\del, 0.02, \fb, 3, \lfo, 100, \freq, 100, \cutoff, 100])
Synth(\feedback4, [\del, 0.5, \fb, 1, \lfo, 200, \freq, 300, \rate, 0.01, \cutoff, 100])

