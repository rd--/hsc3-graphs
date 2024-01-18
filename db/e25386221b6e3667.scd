// vector phase shaping ; https://scsynth.org/t/5169/5 (dietcv)
var nearestEven = {
    arg val;
    var val_floor = val.floor;
    var val_ceil = val.ceil;
    var res = Select.ar(val % 2, [val_floor, val_ceil]);
    var distance = (val - res).abs;
    [res, distance];
};
var nearestOdd = {
    arg val;
    var val_floor = val.floor;
    var val_ceil = val.ceil;
    var res = Select.ar(val + 1 % 2, [val_floor, val_ceil]);
    var distance = (val - res).abs;
    [res, distance];
};
var freq = 110;
var horizontal = MouseX.kr(0.01, 0.99, 0, 0.2);
var vertical = K2A.ar(MouseY.kr(1, 10, 0, 0.2));
var trig = 0;
var vertical_even = nearestEven.value(vertical);
var vertical_odd = nearestOdd.value(vertical);
var vertical_rng = [vertical_even[0], vertical_odd[0]];
var phasor = Phasor.ar(Impulse.ar(trig, 0), freq / 2 * SampleDur.ir, horizontal.neg, 1 - horizontal, horizontal.neg);
var cos = (phasor.bilin(0, horizontal.neg, 1 - horizontal, vertical_rng, 0, 1) * 2 * pi).cos.neg;
var sig = XFade2.ar(cos[0], cos[1], vertical_even[1] * 2 - 1);
LeakDC.ar(sig,  0.995).dup * 0.1
