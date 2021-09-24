// swept resonant noise (jmcc) #2 ; texture=overlap,4,4,5,inf
{var p = 10 // number of partials
;var n = WhiteNoise.ar(0.007)
;var f = FSinOsc.kr(0.1 + Rand.new(0,0.2),0,12 + Rand.new(0,12),60 + Rand.new(-24,24)).midicps
;var sweep = Resonz.ar(n,f,0.1)
;var spec_f = {Ref.new([Array.fill(p,{80 + LinRand.new(0,10000)}),nil,Array.fill(p,{0.5 + Rand.new(0,2)})])}
;var spec = Array.fill(2,spec_f)
;Klank.ar(spec,sweep)}
