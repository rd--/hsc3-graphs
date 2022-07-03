// Sieve1
var sieve = [88] ++ { [0.1.rand, 0.5.rand].wchoose([0.8, 0.2]) }.dup(88);
var gap = MouseX.kr(1, 100, 0, 0.2);
Sieve1.ar(sieve.asLocalBuf, gap, 1) * 0.2
