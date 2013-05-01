{var i = Impulse.ar([1,3,5].reciprocal,[0,0.133,0.5]).sum
;var f = {|st,z| [TDuty.ar(max(0.25,Timer.ar(st.first)),0,1)] ++ st}
;var n = (1..10).inject([i],f)
;n = n.collect{|n,i| SinOsc.ar((4000 + (i * 500))) * Decay2.ar(n,0.01,0.2)}
;Splay.ar(n)}.play
