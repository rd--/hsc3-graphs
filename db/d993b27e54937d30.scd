// lucier (cr) ; texture ; http://www.listarc.bham.ac.uk/lists/sc-users/msg47539.html
var bus = 20;
OverlapTexture({
    arg tr;
    var freq = TRand.kr(56, 64, tr);
    var blocksize = 1 / ControlRate.ir;
    var mk_dt = { arg f; 1 / f - blocksize };
    var string_delay = mk_dt.value(freq);
    var pk1_pos = 0.1;
    var src_pos = 0.3;
    var pk2_pos = 0.9;
    var max_delay = 1;
    var mk_delay = { arg i, r; LPZ1.ar(DelayC.ar(i, max_delay, r * string_delay)) };
    var mk_allpass = { arg i, r, dt; LPZ1.ar(AllpassC.ar(i, max_delay, r * string_delay, dt)) };
    var drv = InFeedback.ar(bus, 1);
    var pk1_R = mk_delay.value(drv, src_pos - pk1_pos);
    var pk1_L = mk_allpass.value(pk1_R * -1, pk1_pos * 2, TRand.kr(0.001, 0.11, tr));
    var pk2_L = mk_delay.value(pk1_L, pk2_pos - pk1_pos) * 0.99;
    var stringL = mk_delay.value(pk2_L, 1 - pk2_pos, r.value);
    var pk2_R = mk_allpass.value(stringL * -1, 1 - pk2_pos, 2 + TRand.kr(0.001, 0.11, tr)) * 0.99;
    var stringR = mk_delay.value(pk2_R, pk2_pos - src_pos);
    var source = {
        var s = SinOsc.ar(220, 0) * 0.01;
        var a = Amplitude.kr(drv, 0.01, 0.01) * 11;
        var p = Pulse.ar(60 + a, 0.5) * 0.1;
        var f = RLPF.ar(s + p, 320, 0.05);
        var e = 1 - Amplitude.kr(drv, 0.01, 0.01).min(1.0);
        Normalizer.ar(f, 0.7, 0.01) * e
    }.value;
    var l_out = ReplaceOut.ar(bus, source * 0.2 + stringR);
    var outL = pk1_L + pk1_R;
    var outR = pk2_L + pk2_R;
    bus = bus + 1;
    [outL, outR].mrg(l_out).mrg(drv)
}, 1, 5, 3) * 0.25
