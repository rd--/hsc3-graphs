// https://fredrikolofsson.com/f0blog/more-sc-twitter/ f0
{var o = SinOsc.ar(Saw.ar(3) * 128 + 128, (Saw.ar(#[3, 4]) * (LFTri.ar(LFTri.kr(0.1, 0) * 8 + 12, 0) * 32 + 128)).sin) / 4
;CombN.ar(o, 1, 1 / 6, LFTri.kr(1 / 32, 0) + 1)}

//---- https://fredrikolofsson.com/f0blog/more-sc-twitter/ f0
{a=LFTri;CombN.ar(SinOsc.ar(Saw.ar(3,128,128),Saw.ar([3,4],a.ar(a.kr(0.1,0,8,12),0,32,128)).sin)/4,1,1/6,a.kr(1/32)+1)}
