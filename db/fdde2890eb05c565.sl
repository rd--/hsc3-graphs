{-********* Use PitchShift to granulate input ; upper left corner is normal playback ; Jmcc *********-}
let grainSize = 0.1;
PitchShift(
	AudioIn([1, 2]) * 0.5,
	grainSize,
	1, {- nominal pitch rate = 1 -}
	MouseX(0, 1, 0, 0.2), {- pitch dispersion -}
	MouseY(0, grainSize, 0, 0.2) {- time dispersion -}
)
