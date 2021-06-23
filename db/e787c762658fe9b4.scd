// RDelaySet - a lot of random delays
{var s = ar(SinOsc,kr(MouseX,110,660,0,0.1),0,kr(MouseY,0,0.4))
;var n = 10
;var a = [fill(Array,n,{rand(5.0)})
         ,fill(Array,n,{(1/5) + rand(4/5)})
         ,fill(Array,n,{(1/40) + rand(1/40)})]
;[s,ar(RDelaySet,s,flatten(flop(a)))]}
