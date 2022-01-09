// https://twitter.com/redFrik/status/1479212835192332289 (f0)
var q = { arg freq; QuadC.ar(freq, 1, -1, -0.75, 0) };
var q1 = q.value(5);
var b = [5, 2.5, 6];
var q2 = q.value(b / 15) * q1;
var e = 1 / 15;
var q3 = q.value(500) * q1 / 99;
var q4 = q.value(999 * b) * q.value(b / 15).max(0) / 999 * q.value(b);
var q5 = q.value([12, 16] * 99) * QuadC.ar(0.1, 1, -1, -0.75, [-0.5, -1]).max(0) * q.value(15).max(0) / 15;
var q6 = Pan2.ar(QuadC.ar(99 * b, 1, q.value(1 / b / [15, 5]) > 0 * 0.375 - 1.25, -0.75, 0).tanh, 0.5 * q2, q2).mean;
q3 + Splay.ar(q4) + AllpassN.ar(q5 + q6, e, e, 15)

//---- https://twitter.com/redFrik/status/1479212835192332289 (f0)
play{d=ar(a=QuadC,5);ar(a,500)*d/99+ar(Splay,ar(a,999*b=[5,2.5,6])*ar(a,b/15).max/999*ar(a,b))+ar(AllpassN,ar(a,[12,16]*99)*ar(a,0.1,xi:[-0.5,-1]).max*ar(a,15).max/15+ar(Pan2,ar(a,99*b,1,ar(a,1/b/[15,5])>0*0.375-1.25).tanh,0.5*c=ar(a,b/15)*d,c).mean,e=1/15,e,15)}
