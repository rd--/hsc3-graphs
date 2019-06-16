// http://sccode.org/1-5aJ - chaos engine hum

(
{
var o1 = SinOsc.kr(101, Saw.kr(0.12345) * 678 + 9) * 0.2 + 0.8;
var o2 = Pulse.kr([25, 25.5], 0.25) * 0.125 - 0.25;
var o3 = SinOsc.kr([50, 51], 0) * o1 + o2;
SinOsc.ar(10 + (50 * o3), 0) * 0.5;
}.play;
)
