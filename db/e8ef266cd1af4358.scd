// xylophone (wa) ; event control ; https://scsynth.org/t/4681/
var voiceFunc = {
    arg e;
	var freq = e.p.unitCps;
    var amp = 1;
    var duration = e.y + 1 * 2 * 440 / freq;
    var scaleBy = 5;
    var velocity = LagUD.kr(0.1 + e.z, 0.01, 1);
    var harmonics = #[1, 4, 7, 9, 13];
    var envVolume = TxLine.kr(1, 0.01, duration, e.w) - 0.01;
    var hDur = (duration / ((1 - scaleBy) + (harmonics * scaleBy))) * velocity;
    var envHarmonics = TxLine.kr(1, 0.01, hDur, e.w) - 0.01;
    var signal = Mix.ar(amp * SinOsc.ar(freq * harmonics, 0) * velocity / harmonics * envHarmonics);
    Pan2.ar(signal, e.o * 2 - 1, envVolume * amp * LagUD.kr(e.w, 0, 2))
};
Mix.ar(Voicer.ar(numVoices: 16, voiceFunc: voiceFunc))
