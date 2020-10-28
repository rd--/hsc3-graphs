// rails (jmcc) #2
Texture.overlap(
{var n = 20 /* resonant modes */
;var e = Dust.ar(100,0.04) /* excitation */
;var f = XLine.kr(3000,300,8) /* sweep filter down */
;var l = Line.kr(1.0.rand2,1.0.rand2,8) /* sweep pan */
;var r = Array.fill(n,{200 + 3000.0.linrand}) /* resonant frequencies */
;var t = Array.fill(n,{0.2 + 1.0.rand}) /* ring times */
;var k = Klank.ar(`[r,nil,t],Resonz.ar(e,f,0.2))
;Pan2.ar(k,l)}, sustainTime:2, transitionTime:3, overlap:4)
