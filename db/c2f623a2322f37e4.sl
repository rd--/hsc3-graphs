;; blip ; event control ; keywords
var f = { :e | Pan2(in: Blip(freq: e.p.unitCps, numharm: e.y * 10 + 1), pos: e.o * 2 - 1, level: e.w * e.z * e.z) };
Voicer(numVoices: 16, voiceFunc: f).sum
