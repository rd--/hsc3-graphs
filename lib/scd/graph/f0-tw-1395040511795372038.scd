// f0  https://twitter.com/redFrik/status/1395040511795372038
var b = [2,6,3,1];
var c = 500;
var f = Duty.ar(b,SinOscFB.ar(b/9),Dseq.dr((SinOscFB.ar(b/24).round+10.iota*7+29.17).midicps,inf));
var o = SinOscFB.ar(f,SinOscFB.ar(b/13).max/3*2);
var p = AllpassN.ar(o/8,1,0.51,8);
var q = BPF.ar(Hasher.ar(SinOscFB.ar(b/12).max,SinOscFB.ar(b/c).max/c),2**SinOscFB.ar(b/c*2)*10000,1/99);
HPF.ar(p+GVerb.ar(q,99,9,0.2),50).clump(2) * 0.2

// ---- f0 ; https://twitter.com/redFrik/status/1395040511795372038
{clump(ar(HPF,ar(AllpassN,ar(a=SinOscFB,ar(Duty,b=[2,6,3,1],ar(a,b/9),Dseq((ar(a,b/24).round+(0..9)*7+29.17).midicps,inf)),ar(a,b/13).max/3*2)/8,1,0.51,8)+ar(GVerb,ar(BPF,ar(Hasher,ar(a,b/12).max,ar(a,b/c=500).max/c),2**ar(a,b/c*2)*1e4,1/99),99,9,0.2),50),2) * 0.2}

// ---- calculations
(0..9) == 10.iota
