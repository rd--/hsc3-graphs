// no-input-fft - https://www.listarc.bham.ac.uk/liasts/sc-users/msg63383.html
var e = Env.new([0.0001, 1, 0.0001, 0.01, 0.0001], [1, 2, 2, 50].normalizeSum * 512, \exp);
var fftSize = 1024;
var binFunc = {
	arg mag, phase, bin;
	e[bin] * SinOsc.kr(rand(0.05), rand(2 * pi)).range(10, 50);
};
var genFunc = { FFT.kr(LocalBuf.ir(fftSize, 1), DC.ar(0), 0.5, 0, 1, 0).pvcollect(fftSize, binFunc) };
IFFT.ar(genFunc.dup(2), 1)
