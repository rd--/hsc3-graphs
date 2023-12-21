(* SplayAz ; Octophonic ; 24->8 *)
var numChannels = 8;
var numVoices = 24;
var orientation = 0;
var inArray = (1 .. numVoices).collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 50 + 400), 0) * 0.1
};
SplayAz(8, inArray, 1, 1, 2, 0, orientation, true)
