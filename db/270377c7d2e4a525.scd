// Allocate and copy a sine wavetable, assign to interpreter variable "b"
var bufferNumber = 10;
var numFrames = 128;
var numChannels = 1;
var sampleRate = 48000.0;
var bufferData = Wavetable.sineFill(numFrames / 2, [1]).as(Array);
var byteSwap = 0;
b = Buffer.alloc(
	s,
	numFrames,
	numChannels,
	BufMemCpy.message(
		bufferNumber,
		numFrames,
		numChannels,
		sampleRate,
		BufMemCpy.encodeFloat32Array(bufferData, true),
		byteSwap
	),
	bufferNumber
)
