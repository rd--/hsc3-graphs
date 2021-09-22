// tw 0030 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/537
{var f = (LFPar.ar(1, 0) * 5 + (LFPar.ar(#[0.05, 0.04],0) * 50 + 160).round(50))
;var w = LFPar.ar(0.2, 0) * 0.5 + (LFPar.ar(3,0) * 0.2 + 0.5)
;var o = VarSaw.ar(f, 0, w) / 8
;GVerb.ar(o, 80, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 0.1}

//---- http://www.fredrikolofsson.com/f0blog/?q=node/537
{a=LFPar;GVerb.ar(VarSaw.ar(a.ar(1,0,5,a.ar([0.05,0.04],0,50,160).round(50)),0,a.ar(0.2,0,0.5,a.ar(3,0,0.2,0.5)))/8,80) * 0.1}
