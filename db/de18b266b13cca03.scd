// Env.circle
var e = Env.new([6000, 700, 100], [1, 1], ['exp', 'lin'], nil, nil, 0).circle(1,\lin);
SinOsc.ar(e.kr(0, 1, 1, 1, 0), 0) * 0.1
