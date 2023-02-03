// https://scsynth.org/t/demand-partial-mask/7072/8 (dcv) ; rewrite as graph
var percEnv = Env.perc(0.01, 1, 1, -4).discretize(2048);
var envBuf = Buffer.sendCollection(s, percEnv, 1); /* c.f. LocalBuf below */
var numPartials = 50;
var tFreq = (1 .. numPartials) / 25 + 1;
var trig = Dust.ar(tFreq);
var freq = 44.midicps;
var inharmonicity = 0.005;
var tiltPerOctaveDb = -3;
var ratioArray = (1 .. numPartials);
var stretchedRatioArray = ratioArray * (inharmonicity * ratioArray * ratioArray + 1).sqrt;
var freqArray = stretchedRatioArray *.t freq;
var ampArray =  (ratioArray.log2 * tiltPerOctaveDb).dbamp;
var amp = -25.dbamp;
var overlap = 1;
var pan = 0;
Pan2.ar(
	GrainSin.ar(
		numChannels: 1,
		trigger: trig,
		dur: overlap / tFreq,
		freq: freqArray,
		envbufnum: envBuf,
		mul: ampArray
	).sum * amp,
	pan
)
