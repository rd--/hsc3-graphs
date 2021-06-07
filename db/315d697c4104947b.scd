// ring modulated and resonant filtered input
{
	var input, modulator;
	input = SoundIn.ar([0,1],0.2);
	modulator = SinOsc.ar(
				MouseX.kr(10,4000,'exponential'),	// mouse x controls ring mod freq
				[0,0.5pi]						// offset phase ofone osc by 90 degrees
			);
	RLPF.ar(
		input * modulator, 					// do ring modulation
		MouseY.kr(100, 12000, 'exponential'), 	// mouse y controls cutoff freq
		0.1)								// bandwidth ratio = 1/Q
}
