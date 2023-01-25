// https://sccode.org/1-5gI ; «Underwater» by Muse Score ; rewritten for clarity & to print voice data
var divisors = { arg n;
	var answer = List[];
	(1 .. n.sqrt.floor).do { arg i;
		(n % i == 0).ifTrue {
			answer.add(i);
			(i == n.div(i)).ifFalse {
				answer.add(n.div(i))
			 }
		 }
	 };
	answer.sort.asArray
};
var logFdivSqrt = { arg n;
	log(n) / sqrt(n)
};
var makeLine = { arg steps, logMul, divArray, hasSustain;
	[
		steps,
		1 / (logMul * log(divArray)), /* dur */
		divArray.collect(divisors), /* freq */
		hasSustain.if { divArray.collect(logFdivSqrt) } { nil } /* sustain */
	]
};
var makeGroup = { arg logMul, divMin, hasSustain;
	[
		makeLine.value(3 * 5, logMul, (divMin .. divMin + 2), hasSustain),
		makeLine.value(2 * 5, logMul, (divMin .. divMin + 3), hasSustain),
		makeLine.value(2 * 3, logMul, (divMin .. divMin + 5), hasSustain)
	]
};
var noteData = [
	makeGroup.value(1, 1000, true),
	makeGroup.value(2, 500, false),
	makeGroup.value(3, 1000, true)
];
var sectionData = [
	[[1], 1],
	[[2], 1],
	[[1, 2], 2],
	[[0], 3],
	[[0, 1], 1],
	[[0, 2], 2],
	[[0, 1, 2], 3],
	[[0, 2], 2],
	[[0, 1], 1],
	[[0], 1]
];
var syn = SynthDef('sin', { arg out = 0, freq, amp, sustain;
	var env = EnvGen.kr(Env.linen(0.001, sustain, 0.1, 1, 'lin'), 1, 1, 0, 1, Done.freeSelf);
	Out.ar(out, SinOsc.ar(freq, 0) * amp / 9 * env ! 2)
}).add;
var linePbind = { arg steps, durArray, freqArray, sustainArray;
	var dur = Pseq(durArray, inf);
	var freq = Pseq(freqArray, steps);
	var sustain = sustainArray.isNil.if { dur * 0.8 } { Pseq(sustainArray, steps) };
	Pbind(
		'instrument', 'sin',
		'amp', 0.065,
		'dur', dur,
		'freq', freq,
		'sustain', sustain
	)
};
var groupPpar = { arg voiceArray;
	Ppar(voiceArray.collect { arg paramArray;
		linePbind.valueArray(paramArray)
	}, 1)
};
var sectionPpar = { arg paramArray;
	var groupArray = noteData.collect(groupPpar);
	Ppar(paramArray[0].collect { arg each;
		groupArray[each]
	}, paramArray[1])
};
noteData.asCompileString.postln;
Pseq(sectionData.collect(sectionPpar), inf).play(TempoClock(40 / 60))
