// resonators harmonic series (jmcc) #2
Texture.xfade(
{var p = 12 /* number of overtones */
;var noise = BrownNoise.ar(0.001)
/* two octaves of a just diatonic scale expressed as ratios */
;var rat = #[1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0]
/* one value is chosen at random and multiplied by a 120 Hz fundamental */
;var freq0 = rat.choose * 120.0
/* filter bank specification */
;var frequencies = Array.series(p, freq0, freq0) + Array.fill(p, {0.5.rand2})
;var amplitudes = Array.fill(p, {arg i; 1 / (i + 1)})
;var ringtimes = Array.fill(p, {0.5 + 4.0.rand})
;var spec = Array.fill(2, {`[frequencies, amplitudes, ringtimes]})
;Klank.ar(spec, noise)}, 1, 7)
