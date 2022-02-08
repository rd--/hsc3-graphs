// pretty ; nice, but inessential ; https://github.com/cianoc/supercollider_fragments
var f = {
    arg i;
    var freq = MouseX.kr(0.1.rrand(5.0), 3.0.rrand(20.0), 0, 0.2);
    var amp = LFNoise0.kr(MouseX.kr(1.rrand(6), 6.rrand(1), 0, 0.2)).max(0);
    var osc = SinOsc.ar(SinOsc.ar(freq, 0) * MouseY.kr(10, 50, 0.2) + 200.rrand(5000), 0) * amp;
    Pan2.ar(osc, 1.0.rand2, 0.03) };
Mix.fill(12, f)
