// blips 001 (jmcc) #SC3d1.5
{var blip_f =
  {var f = XLine.kr(exprand(0.25, 400), exprand(0.25, 400), 4)
  ;var nh = XLine.kr(exprand(2, 100), exprand(2, 100), 4)
  ;Blip.ar(f, nh)}
;var syn_f = {Pan2.ar(blip_f.() * blip_f.(),Line.kr(1.0.rand2, 1.0.rand2, 4), 0.3)}
;var gen_f = {if(0.8.coin, syn_f, {Silent.ar})}
;var pp_f =
  {arg z
  ;z = z.distort
  ;6.do({z = AllpassN.ar(z, 0.05, [0.05.rand, 0.05.rand], 4)})
  ;z}
;RTexture.overlap(gen_f, 2, 1, 12, postProcess: pp_f)}.()
