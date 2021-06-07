// pitch shift input
{
	PitchShift.ar(
		SoundIn.ar([0,1],0.5),	// stereo audio input
		0.04, 			// grain size
		MouseX.kr(0,2), // mouse x controls pitch shift ratio
		0, 			// pitch dispersion
		0.004			// time dispersion
	)
}
