// LFSaw
var f = {
    arg i;
    var o = LFSaw.ar(11.9 * (8.0625 / 4 ** i));
    BLowPass4.ar(o * 0.01, 25 * (6.125 / 4 ** i) * 11)
};
Splay.ar(8.collect(f)) * 0.4
