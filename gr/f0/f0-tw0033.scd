// www.fredrikolofsson.com/f0blog/?q=node/537

{var f = LFPar.ar(1/14,0).round * 20 + 80
;var a = Pulse.ar({|i| i + 1} ! 4,0.35)
;var n = BrownNoise.ar(a)
;var z = {|i| [(i + 1) * f,(i * f) + (i + 1 / 3)]}
;var o = LFPar.ar(z ! 4,0)
;var s = Splay.ar((o > n) / 3)
;Mix(s) * 0.1}.play