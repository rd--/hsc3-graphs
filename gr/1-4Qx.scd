// http://sccode.org/1-4Qx

{var l = LFCub
;var f = l.kr(9.1,0,100,(200,300..500))
;var g = l.kr(9,0,1,l.kr(1/[2,3,5,7],0,0.5,0))
;var h = l.kr(1/2,0,0.4,0.5)
;Splay.ar(l.ar(f,0,(g>h).lag/2))}.play
