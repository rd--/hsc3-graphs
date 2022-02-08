// tmm881 ; https://scsynth.org/t/3319 ; (rd edit)
var vc = {
    arg e;
    var freq = (e.x * 25 + 48).midicps + [0, TRand.kr(1, 4, e.w)];
    var carriers = [SinOsc, Saw, Pulse].collect({arg osc; osc.ar(freq)});
    var modulators = carriers.collect({arg c; SinOsc.kr(TRand.kr(0.0322, 1.0, e.w) * 0.0647, 0)});
    var mix = Mix.ar(carriers * modulators);
    var filterEnv = EnvGen.kr(Env.new(#[3600, 220, 3600], [e.y * 2, 16], \exp, 1, nil, 0), e.w, 1, 0, 1, 0);
    Mix.ar(Pan2.ar(LPF.ar(mix, filterEnv), e.o * 2 - 1, LagUD.kr(e.w * e.z, 0, 0.25)))};
var pre = Mix.ar(Voicer.ar(16, vc));
FreeVerb2.ar(pre.at(0), pre.at(1), 0.33, 0.5, 0.5)
