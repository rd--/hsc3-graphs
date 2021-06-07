// ring modulate input
{
	var input, modulator;
	input = SoundIn.ar([0,1]);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	input * modulator
}
