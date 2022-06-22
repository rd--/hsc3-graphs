// clustered sines (jmcc) #2
Texture.xfade(
{var n = 80
;var f1 = 100 + 1000.0.rand
;var f2 = 4.0 * f1
;var z_f = /* sine oscillator bank specification function */
 {var y = Array.fill(n, {f1 + f2.rand}) /* frequencies */
 ;var a = f1 / y /* amplitudes */
 ;`[y, a, nil /* phases default to zero */]}
 ;var z = Array.fill(2, z_f)
 ;Klang.ar(z, 1, 0) * (0.3 / n)},4,4)
