// ring modulate input using ring1
{
	var input, modulator;
	input = SoundIn.ar([0,1], 0.5);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	input ring1: modulator
}
