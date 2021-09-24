// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 41]
{var n =
 {arg i
 ;var f = 1.9 ** i / 128
 ;var p = {PinkNoise.ar}.dup(2)
 ;var b = 4 ** LFNoise2.kr(freq: 1.2 ** i / 16)
 ;BPF.ar(in: p, freq: b * 300, rq: 0.15) * (5 ** LFNoise2.ar(freq: f) / (i + 8) * 20)}
;Splay.ar(n.dup(15))}
