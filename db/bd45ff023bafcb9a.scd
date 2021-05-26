// https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
{var numChan = 2
;var totalInst = 50
;var partials = 40
;var baseFreq = 69.midicps
;var scale = Scale.major(\just)
;var voiceFunc =
 {var sig = Decay.ar(in: Dust.ar(density: 1/totalInst) * 0.5, decayTime: 0.001, mul: PinkNoise.ar)
 ;var gen = {arg f; Array.fill(partials, f)}
 ;var freq = gen.value({baseFreq * scale.degreeToRatio(0.rrand(60))})
 ;var a = [freq, gen.value({0.1.rrand(0.9)}), gen.value({0.5.rrand(9.0)})]
 ;Klank.ar(specificationsArrayRef: Ref.new(a), input: sig, freqscale: 1, freqoffset: 0, decayscale: 1)}
;SplayAz.arFill(numChans: numChan, n: totalInst, function: voiceFunc)}
