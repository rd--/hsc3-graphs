// tw 0028 (f0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537
{var p = Dseq.new(Dshuf.new(List.fib(16) % 8 * 99,8),inf)
;var q = CombN.ar(Duty.ar(1/8,0,p),4,4,16)
;var o = LFTri.ar(q)/4
;var f = LFTri.kr(1/16,0,2000,3000)
;MoogFF.ar(o,f) ! 2}

//----
{MoogFF.ar(LFTri.ar(CombN.ar(Duty.ar(1/8,0,Dseq(Dshuf(List.fib(16)%8*99,8),inf)),4,4,16))/4,LFTri.kr(1/16,0,2e3,3e3))!2}
