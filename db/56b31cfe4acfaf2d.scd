// https://twitter.com/sluyterrific_sc/status/435684664200540161 (es)
var i = 1;
var o = List.new;
var f = {
	var m = (i % (LFNoise2.kr(0.01) * 50 + 50)) + (LFNoise2.kr(0.1) * 10 + 40);
	o.add(SinOsc.ar(m.midicps, 0) * (LFNoise2.kr(1) * 0.01 + 0.01));
	i = i + 1
};
99.do(f);
Splay.ar(o)
