;; CombC ; https://sccode.org/1-5fc ; requires=AudioIn ; warning=feedback
var reverb = { :input |
	var c = CombL(input, 0.1, SinOsc(0.01, 0) * 0.03 + 0.07, 5) * 0.7;
	XFade2(Lpf(c, 4800), input, -0.5, 0.3)
};
reverb(AudioIn([1, 2]) * 0.1)
