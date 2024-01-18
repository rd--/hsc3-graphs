// http://earslap.com/weblog/music-release-laconicism.html
var t = [0, 3, 5, 7, 10, 12] + 40;
var p = Duty.ar(1/4, 0, Drand.dr((t + 12 ++ t).midicps, inf));
var b = TRand.ar(1500, 2000, Impulse.ar(16, 0)).lag;
Blip.ar([b, b + p], 1).mean.dup(2) ** 2
