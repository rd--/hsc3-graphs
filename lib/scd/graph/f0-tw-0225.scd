// tw 0225 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/617
var b = 8.iota + 1 * 99;
var o = Blip.ar(b / 2 + (LFSaw.kr(-8 / b, 1) * 99), b / 4 + (LFSaw.kr(1 / b, 1) * 99));
Splay.ar(CombN.ar(o * SinOsc.ar(8 / b, LFSaw.ar(99 / b, 0)), 0.2, 0.2, 1)).sin * 0.5

//---- calculations
1.series(nil,8) == 8.iota(1)
8.iota(1) == (8.iota + 1)
