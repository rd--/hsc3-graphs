// bouncing lightbulbs, pencils, cans, and other assorted objects (jmcc) #2

"/home/rohan/sw/hsc3-graphs/gr/overlap-texture.scd".load;

~spawn.({
    // impulses trigger decay envelope
    var imp_frq = XLine.kr(5 + 2.0.rand2, 600, 4); // accellerating frequency
    var imp_amp = XLine.kr(0.09, 0.000009, 4); // decaying impulse amplitude
    var imp = Impulse.ar(imp_frq,0,imp_amp);
    // decays excite filter bank
    var exc = Decay.ar(imp,0.001);
    // resonant filter bank simulates resonant modes of bouncing objects
    var flt_frq = Array.fill(4, { 400 + 8000.0.rand }); // resonant freqs
    var flt_amp = Array.fill(4, { 1.0.rand });
    var flt_rtm = Array.fill(4, { 0.01 + 0.1.rand });
    var flt = Klank.ar(`[flt_frq,flt_amp,flt_rtm],exc);
    // place each bouncer at a random position in the stereo field
    var loc = Pan2.ar(flt,1.0.rand2);
    // 3 second cut off envelope to end sound
    var e = Env.new([1, 1, 0],[3, 0.001]);
    loc * EnvGen.kr(e,doneAction:2);
}, nextTime: { 0.6 + 0.6.rand });
