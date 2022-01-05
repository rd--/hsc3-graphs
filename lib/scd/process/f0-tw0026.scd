// http://www.fredrikolofsson.com/f0blog/?q=node/537
var n = [0,0,0,0,0,0,0,3,4,6,4,0,3,2,0,0,0,0,1,6,0,1,0,0,0,0,0,0,4,0,0,3,1,1,2,0,0,3,3,0,0,3,4,0,1,3,0,0,0,0,1,0,1,7,0,0,5,6,3,0,4,0,9,0];
var b = [0, 2, 4, 5, 7, 9, 11].asLocalBuf;
var t = Impulse.kr(4, 0);
var m = DegreeToKey(b, Demand.kr(t, 0, Dseq.dr(n, inf)), 12);
var e = Decay2.kr(t, 0.01, 0.25);
CombL.ar((Blip.ar(m.midicps, 9) * 8 * e).tanh / 8, 1, 1, 8).dup * 0.1


// http://www.fredrikolofsson.com/f0blog/?q=node/537
{CombL.ar(In.ar(8).tanh/8,1,1,8)!2 * 0.1}.play
;Pbind(\amp,8,\dur,1/4,\degree,Pseq(List.fib(32)%(List.fib(64)%12),inf),\out,8).play

//----
var n1 = List.fib(32);
var n2 = List.fib(64);
var n3 = n2 % 12;
var n4 = n1 % n3;
n4 == [0,0,0,0,0,0,0,3,4,6,4,0,3,2,0,0,0,0,1,6,0,1,0,0,0,0,0,0,4,0,0,3,1,1,2,0,0,3,3,0,0,3,4,0,1,3,0,0,0,0,1,0,1,7,0,0,5,6,3,0,4,0,9,0]
