// generative landscape (jrhb)  https://www.listarc.bham.ac.uk/lists/sc-users/msg68991.html;
var x = MouseX.kr(-10, 10, 0, 0.1);
var y = MouseY.kr(0, 5, 0, 0.1);
var i = LFSaw.kr(0.062,0).range(-10, 10) + (y * (0 .. 7));
var d = i.frac;
var a = 0.8 - d.moddif(0.5, 1);
var z1 = i.gcd(x) + d;
var z2 = i.lcm(x) + d;
var freq = 120 * ([z1, z2].flop.abs + 1);
(SinOsc.ar(freq,0) * AmpComp.kr(freq,261.625,1/3) * a).mean * 0.1
