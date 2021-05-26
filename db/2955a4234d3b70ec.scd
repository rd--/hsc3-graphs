// f0 ; https://twitter.com/redFrik/status/1395040511795372038
{clump(ar(HPF,ar(AllpassN,ar(a=SinOscFB,ar(Duty,b=[2,6,3,1],ar(a,b/9),Dseq((ar(a,b/24).round+(0..9)*7+29.17).midicps,inf)),ar(a,b/13).max/3*2)/8,1,0.51,8)+ar(GVerb,ar(BPF,ar(Hasher,ar(a,b/12).max,ar(a,b/c=500).max/c),2**ar(a,b/c*2)*1e4,1/99),99,9,0.2),50),2) * 0.2}
