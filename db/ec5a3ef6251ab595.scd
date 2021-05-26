// event control ; https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
{var voiceFunc =
 {arg e
 ;var numPartials = 40
 ;var baseFreq = (e.x * 25 + 48).midicps
 ;var scale = Scale.major(\just)
 ;var sig = Decay.ar(in: K2A.ar(e.w), decayTime: 0.001, mul: PinkNoise.ar)
 ;var gen = {arg f; Array.fill(numPartials, f)}
 ;var freq = gen.value({baseFreq * scale.degreeToRatio(0.rrand(60))})
 ;var a = [freq, gen.value({0.1.rrand(0.9)}), gen.value({0.5.rrand(9.0)})]
 ;var o = DynKlank.ar(specificationsArrayRef: Ref.new(a), input: sig, freqscale: 1, freqoffset: 0, decayscale: 1)
 ;Pan2.ar(o * 0.1 / numPartials, e.o * 2 - 1, LagUD.kr(e.w * e.z, 0, 8))}
;Mix.ar(REvent.voicer(numVoices: 16, voiceFunc: voiceFunc)) * 0.5}
