// ring modulate input (jmcc) #5
var input = AudioIn.ar([1, 2]);
var x = MouseX.kr(10, 4000, 'exponential', 0.2); // mouse x controls ring mod freq
var modulator = SinOsc.ar(x, [0, 0.5 * pi]); // offset phase of one osc by 90 degrees
input * modulator
