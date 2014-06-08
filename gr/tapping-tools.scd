// tapping tools (jmcc) #7

~spawn.({
    var e = Env.linen(1, 4, 1);
    var rate = XLine.kr(64, 0.125, 60);
    var exc = Decay.ar(Impulse.ar((1 + 20.0.linrand) * rate, 0, 0.03), 0.001);
    var spc = `[Array.fill(4, {400 + 8000.0.rand}), nil, Array.fill(4, {0.01 + 0.1.rand})];
    var flt = Klank.ar(spc, exc);
    Pan2.ar(flt, 1.0.rand2, EnvGen.kr(e, doneAction:2))
}, 2);
~post_process.({arg z = 3.do({z = AllpassN.ar(z, 0.05, [0.05.rand,0.05.rand], 2);}); z});
