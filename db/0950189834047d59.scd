// tw 0028 (f0) ; http://www.fredrikolofsson.com/f0blog/?q=node/537 ; wait for it...
var p = Dseq.dr(Dshuf.dr(List.fib(16) % 8 * 99, 8),inf);
var q = CombN.ar(Duty.ar(1/8, 0, p, 0), 4, 4, 16);
var o = LFTri.ar(q, 0) / 4;
var f = LFTri.kr(1/16, 0) * 2000 + 3000;
MoogFF.ar(o, f, 2, 0) ! 2
