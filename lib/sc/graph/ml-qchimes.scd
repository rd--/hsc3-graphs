// https://www.listarc.bham.ac.uk/lists/sc-users/msg68844.html (ml)
{var numChan = 2
;var totalInst = 50
;var partials = 40
;var baseFreq = 69.midicps
;var scale = Scale.major(\just)
;SplayAz.arFill(numChan, totalInst,
{Klank.ar(
`[Array.fill(partials, {baseFreq * scale.degreeToRatio(rrand(0, 60))})
 ,Array.fill(partials, {rrand(0.1, 0.9)})
 ,Array.fill(partials, {rrand(0.5, 9.0)})]
,Decay.ar(Dust.ar(1/totalInst) * 0.5, 0.001, PinkNoise.ar))})}.play

// ----
(0 .. 60).collect({arg x; Scale.major(\just).degreeToRatio(x)}).asCompileString