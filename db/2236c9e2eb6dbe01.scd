// use of dust with rising sounds ; https://github.com/cianoc/supercollider_fragments
var f = {
    var d = [{ 1000.exprand(10000) }.dup(3), nil, { 1.0.rrand(4.0) }.dup(15)];
    Pan2.ar(Klank.ar(Ref.new(d), Dust.ar(1/3) * 0.1, 1, 0, 1), LFTri.kr(3.0.rrand(10.0), 0), 0.1) };
Mix.ar(f.dup(20))
