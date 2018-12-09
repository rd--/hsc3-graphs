SynthDef(\sin, {
    arg out = 0, freq = 440, amp = 0.1, loc = 0.0;
    var o = SinOsc.ar(freq, 0) * amp;
    Out.ar(out, Pan2.ar(o, loc, 1));
}).add;

Pdefn(\d, Pwhite(0.0, 2 * (1 / 1.6), inf));
Pdefn(\n, Prand([60, 62, 64, 65, 67, 69], inf));
Pdefn(\l, Prand([-1, -0.5, 0, 0.25, 0.75, 1.0], inf));
Pdefn(\a, Prand([0.01, 0.05, 0.1, 0.15, 0.25, 0.35], inf));
Pdefn(\s, Prand([0, 0, 0, 0, 0, 0], inf));

(
var mk_p = {arg k; Pmono(\sin, \k, k, \dur, Pdefn(\d), \midinote, Pdefn(\n), \loc, Pdefn(\l), \amp, Pdefn(\a), \stop, Pdefn(\s))};
var proc_f = {arg e; ["/tr_out",-1,e.at(\k),e.at(\midinote),e.at(\loc),e.at(\amp),e.at(\stop)].postln; e};
6.do({arg k; mk_p.(k).collect(proc_f).play});
)

Pdefn(\d, Pwhite(0.0, 2 * (1 / 0.25)));
Pdefn(\n, Prand([40, 52, 54, 65, 67, 69],inf));
Pdefn(\n, Prand([60.0,61.932,63.863,65.034,66.968,68.897],inf));
Pdefn(\l, Prand([-0.2, -0.1, -0.0, 0.0, 0.1, 0.2],inf));
Pdefn(\a, Prand([0.001, 0.002, 0.005, 0.0075, 0.01, 0.0125, 0.015],inf));

PdefnAllGui();
