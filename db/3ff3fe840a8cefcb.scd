// http://earslap.com/weblog/music-release-laconicism.html
var t = [0, 0, 0, 1, 5, 7, 10, 12, 12, 12] + 30;
var a = Duty.kr(1/8, 0, Dxrand.dr(t + 24 ++ t ++ t, inf));
(BHiPass.ar(LFNoise1.ar(8) ** 6, [a, a + 7].midiCps, a / 3000) * (67 - a)).tanh
