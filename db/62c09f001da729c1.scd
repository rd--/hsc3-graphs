// input noise gate
var input;
input = SoundIn.ar([0,1]);
Compander.ar(
	input, input,
	MouseX.kr(0.01, 0.5), 		// threshold
	10, 		// below threshold slope
	1		// above threshold slope
)
