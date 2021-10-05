// tw 0028 (f0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 ; wait for it...
{var p = Dseq.dr(Dshuf.dr(List.fib(16) % 8 * 99, 8),inf)
;var q = CombN.ar(Duty.ar(1/8, 0, p, 0), 4, 4, 16)
;var o = LFTri.ar(q, 0) / 4
;var f = LFTri.kr(1/16, 0) * 2000 + 3000
;MoogFF.ar(o, f, 2, 0) ! 2}

//---- http://www.fredrikolofsson.com/f0blog/?q=node/537
{MoogFF.ar(LFTri.ar(CombN.ar(Duty.ar(1/8,0,Dseq(Dshuf(List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2}

//---- calculations
List.fib(16) // 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987
