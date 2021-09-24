// f0 <https://twitter.com/redFrik/status/1367808902457397250>
{var rat = #[76.11, 76.11, 64, 57.02, 38.05, 85.43, 32, 114.04, 42.71, 47.95, 95.89]
;var f =
 {arg i
 ;var f0 = rat.at(i) * (SinOsc.ar(1 / 16, 0) > 0 * 2 + 6 - (SinOsc.ar(SinOsc.ar(1 / 32, i), 0) / 20))
 ;var z = SinOsc.ar(f0, 0) / 9
 ;var x = (SinOsc.ar(1 / 64, 0) * 6 + 6).floor.varlag(0.1, 0, 5)
 ;var y = (SinOsc.ar(SinOsc.ar(1 / 4, i / 11 * pi) < 0 * 2) * 0.1).varlag(0.01, SinOsc.ar(0.01, i), 5)
 ;var dly = i + x % 11 / 33 + 0.1 + y
 ;var dcy = SinOsc.ar(1 / 9, 0) + 1
 ;CombC.ar(z, 0.5, dly, dcy)}
;Splay.ar(f.dup(10), 1, 1, 0, true).tanh}
