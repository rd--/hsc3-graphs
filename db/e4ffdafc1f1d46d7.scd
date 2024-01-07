// use PitchShift to granulate input ; upper left corner is normal playback. x = pitch dispersion, y = time dispersion
var grainSize;
grainSize = 0.1;
PitchShift.ar(
	SoundIn.ar([0,1],0.5),
	grainSize,
	1,					// nominal pitch rate = 1
	MouseX.kr(0,1), 		// pitch dispersion
	MouseY.kr(0, grainSize)	// time dispersion
)
