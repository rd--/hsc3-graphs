// https://sccode.org/1-5aJ (fl) ; chaos engine hum
var o = SinOsc.kr(101, Saw.kr(0.12345) * 678 + 9) * 0.2 + 0.8;
var p = Pulse.kr([25, 25.5], 0.25) * 0.125 - 0.25;
var f = SinOsc.kr([50, 51], 0) * o + p * 50 + 10;
SinOsc.ar(f, 0) * 0.5
