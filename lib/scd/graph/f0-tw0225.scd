// tw 0225 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/617
{var b = (1..8) * 99
;var o = Blip.ar(b / 2 + LFSaw.kr(-8 / b,1,99),b / 4 + LFSaw.kr(1 / b,1,99))
;Splay.ar(CombN.ar(o * SinOsc.ar(8 / b,LFSaw.ar(99 / b)))).sin * 0.5}
