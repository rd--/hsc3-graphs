;; https://scsynth.org/t/5296 ; tm881
var a = Blip(
	[
		Rand(1, 30),
		TRand(0.125, 4, Impulse([1 / 4, 1 / 7], 0)),
		XLn(Rand(0.125, 4), Rand(0.125, 4), 15)
	].product,
	200);
var r = GVerb(Saw(322) * a, 10, 0.3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300);
r.transpose.sum * 0.25
