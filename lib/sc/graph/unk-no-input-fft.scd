// no-input-fft - https://www.listarc.bham.ac.uk/liasts/sc-users/msg63383.html
{var e = Env([0.0001, 1, 0.0001, 0.01, 0.0001], [1, 2, 2, 50].normalizeSum * 512, \exp);
 var fft_size = 1024;
 var bin_f = {
  arg mag, phase, bin;
  e[bin] * SinOsc.kr(rand(0.05), rand(2pi)).range(10, 50);
 };
var gen_f = {FFT(LocalBuf(fft_size), DC.ar(0)).pvcollect(fft_size, bin_f)};
IFFT(gen_f ! 2, 1);
}
