"overlap-texture.scd".loadRelative

~overlap_texture.(
{var imp_seq = {arg dm, tr; Demand.ar(tr, 0, dm) * tr}
;var d1 =
  [Dseq([2.0,0.0,2.0,0.0,1.0,0.0,1.0,1.0],1)
  ,Dseq([2.0,0.0,1.0,0.0,1.0,0.0,1.0,0.0],1)
  ,Dseq([2.0,0.0,1.0,1.0,1.0,1.0,1.0,0.0],1)
  ,Dseq([2.0,0.3,0.3,1.0,0.3,0.3,1.0,0.3],1)
  ,Dseq([2.0,0.0,0.3,0.0,0.3,0.0,0.3,0.0],1)
  ,Dseq([2.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0],1)
  ,Dseq([2.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],1)
  ,Dseq([0.0,1.0,0.0,1.0,0.0,1.0,0.0,1.0],1)
  ,Dseq([1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,0.0,1.0,0.0,1.0,0.0],1)]
;var d2 = Drand(d1,inf)
;var seq = imp_seq.(d2,Impulse.ar(10,0))
;var exc = Decay.ar(seq,0.1) * PinkNoise.ar(0.01)
;var f0 = 40 + 300.0.rand
;var n = 8
;var spc = [Array.fill(n,{f0 + (4.0*f0).linrand}),nil,Array.fill(n,{0.2 + 3.0.linrand})]
;var res = Klank.ar(`spc,exc)
;Pan2.ar(res,1.0.rand2)},8,4,4,2)
