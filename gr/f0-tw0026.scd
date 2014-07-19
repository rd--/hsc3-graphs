// http://www.fredrikolofsson.com/f0blog/?q=node/537

{CombL.ar(In.ar(8).tanh/8,1,1,8)!2 * 0.1}.play
;Pbind(\amp,8,\dur,1/4,\degree,Pseq(List.fib(32)%(List.fib(64)%12),inf),\out,8).play
