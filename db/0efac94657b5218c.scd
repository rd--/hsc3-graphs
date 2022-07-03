// Sieve1
var sieve = [10] ++ { 0.75.rand }.dup(10);
var gap = MouseX.kr(2, 100, 0, 0.2);
Sieve1.ar(sieve.asLocalBuf, gap, 1) * 0.2
