// http://www.fredrikolofsson.com/f0blog/?q=node/537
{var a = LFPar
;var f = a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50))
;var w = a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5))
;var o = VarSaw.ar(f,0,w) / 8
;GVerb.ar(o,80) * 0.1}
