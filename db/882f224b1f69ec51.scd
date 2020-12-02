// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
{var n = LFNoise2
;var a = 0.01
;var f = {arg i; SinOsc.ar(midicps((i%n.kr(a,50,50))+n.kr(0.1,10,40)))*n.kr(1,a,a)}
;Splay.ar((1..99).collect(f))}
