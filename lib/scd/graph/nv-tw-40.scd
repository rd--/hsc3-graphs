// https://swiki.hfbk-hamburg.de/MusicTechnology/899 (nv) [Line 40]
{var f =
 {arg i
 ;var t = 0.6 ** i * 40 * Impulse.ar(freq: 2 ** i / 32, phase: 1 / 2)
 ;var f = 4 ** LFNoise0.kr(freq: 1 / 16) * 300
 ;RLPF.ar(in: t, freq: f, rq: 0.005).sin}
;var x = Splay.ar(inArray: f ! 8, spread: 1, level: 1, center: 0, levelComp: true)
;2.do({x = FreeVerb2.ar(*x ++ [0.1,1,1])})
;x}
