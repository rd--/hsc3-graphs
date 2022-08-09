// http://www.fredrikolofsson.com/f0blog/?q=node/537
{ CombL.ar(In.ar(8, 1).tanh / 8, 1 , 1, 8).dup(2) * 0.1 }.play;
Pbind(\amp, 8,\dur, 1 / 4, \degree, Pseq(List.fib(32) % (List.fib(64) % 12), inf),\out, 8).play

//----
var n1 = List.fib(32);
var n2 = List.fib(64);
var n3 = n2 % 12;
var n4 = n1 % n3;
n4 == [0,0,0,0,0,0,0,3,4,6,4,0,3,2,0,0,0,0,1,6,0,1,0,0,0,0,0,0,4,0,0,3,1,1,2,0,0,3,3,0,0,3,4,0,1,3,0,0,0,0,1,0,1,7,0,0,5,6,3,0,4,0,9,0]
