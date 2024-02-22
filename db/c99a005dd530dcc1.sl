{- SplayAz ; Octophonic ; 24->8 -}
let numChannels = 8;
let numVoices = 24;
let orientation = 0;
let inList = 1:numVoices.collect { :each |
	SinOsc(LfNoise2(Rand(10, 20)) * 200 + (each * 50 + 400), 0) * 0.1
};
SplayAz(8, inList, 1, 1, 2, 0, orientation, true)
