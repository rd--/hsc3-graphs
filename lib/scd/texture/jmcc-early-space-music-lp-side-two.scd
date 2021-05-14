// early space music lp side two (jmcc) #12
RTexture.overlap({
    [{
        var a = 20.0.rand;
        var b = 5000.0.rand;
        var c = 20.0.rand;
        var pan = 1.0.rand2;
        Pan2.ar(SinOsc.ar(SinOsc.ar(a, 0, 0.1*b, b), 0, SinOsc.kr(c, 0, 0.08, 0.08)), pan)
    },{
        var a0 = 200.0.rand + 40;
        var a1 = a0 + 1.0.rand2;
        var a = [a0, a1];
        var b = exprand(50,2400);
        var c = [a0 + 1.0.rand2, a1 + 1.0.rand2];
        SinOsc.ar(SinOsc.ar(a, 0, 1.0.rand * b, b), 0, SinOsc.kr(c, 0, 0.025, 0.025))
    },{
        var f = (60 + 40.rand).midicps;
        FSinOsc.ar([f, f + 0.2], 0, LFNoise2.kr(f*[0.15, 0.16], 0.1));
    },{
        var f = rrand(24, 96).midicps;
        var r = XLine.kr(exprand(0.1,20),exprand(0.1,20), 25.6);
        var n = 12;
        Mix.arFill(n, {
            arg i;
            var a = SinOsc.kr( r * rrand(0.9,1.1),2pi.rand,0.1,-0.05);
            var o = FSinOsc.ar(f * i + f, 0, a.max(0));
            Pan2.ar(o * (1/(i+1)), 1.0.rand2)
        }) * LFPulse.kr(exprand(0.2,1.2), 0, rrand(0.1,0.2));
    },{
        var f = LFNoise1.kr(0.3.rand, 60, 70).midicps;
        var o = SinOsc.kr(40.0.rand,0,0.1);
        var a = LFNoise2.ar(f * 0.5.rand, LFNoise1.kr(8.0.rand, o).max(0));
        var z = SinOsc.ar(f, 0, a);
        Pan2.ar(z, LFNoise1.kr(5.0.rand));
    },{
        var f1 = 100;
        var f2 = 6000.0;
        var f = Array.fill(p, { exprand(f1, f2) }); // frequencies
        var rt = Array.fill(p, { 2.0 + 4.0.rand });	// ring times
        var z = Array.fill(2, {`[f, nil,rt]});
        var f3 = XLine.kr(exprand(40.0, 300.0), exprand(40.0, 300.0), 12);
        var in = LFPulse.ar(f3, 0, rrand(0.1, 0.9), 0.002 * LFNoise2.kr(8.0.rand).max(0));
        Klank.ar(z, in).distort * 0.3;
    }].choose.value;
}, 2, 4, 2, 6, postProcess: {
    arg z;
    var fn = {CombN.ar(z, 0.3, [rrand(0.1,0.3),rrand(0.1,0.3)], 8)};
    Mix.arFill(5,fn) * 0.3;
})
