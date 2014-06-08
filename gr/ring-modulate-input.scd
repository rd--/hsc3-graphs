// ring modulate input (jmcc)

play({
    var input = SoundIn.ar([0,1]);
    var modulator = SinOsc.ar(
		MouseX.kr(10,4000,'exponential'), /* mouse x controls ring mod freq */
		[0,0.5pi] /* offset phase of one osc by 90 degrees */
	);
    input * modulator
})
