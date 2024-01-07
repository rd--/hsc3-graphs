(* http://earslap.com/weblog/music-release-laconicism.html *)
let t = [0 3 5 7 10 12] + 40;
let p = Duty(1 / 4, 0, Drand(inf, (t + 12 ++ t).MidiCps));
let b = TRand(1500, 2000, Impulse(16, 0)).Lag(0.1);
Blip([b, b + p], 1).mean ^ 2
