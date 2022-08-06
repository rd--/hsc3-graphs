// https://sccode.org/1-4Qy ; f0 ; 0331
var b = [3, 3, 2, 2, 2, 1, 2, 2, 2]/3;
var c = Spring.ar(TDuty.ar(Dseq.dr(b, inf)) / 9, 1, 0);
Ringz.ar(c, 50 * Duty.ar(c + 1 / [6, 3], 0, Dseq.dr(c.lag(0.1) > 0 + [2, 4] / b, inf)))

//--tweet0331
Ringz.ar(c=Spring.ar(TDuty ar:Dseq(b=[3,3,2,2,2,1,2,2,2]/3,inf))/9,50*Duty.ar(c+1/[6,3],0,Dseq(c.lag>0+[2,4]/b,inf)))
