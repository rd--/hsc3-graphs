// choip (jmcc) #10
(var gen_f =
  {var t = 12
  ;var i = Impulse.ar(XLine.kr(exprand(1,30),exprand(1,30),t))
  ;var f = XLine.kr(exprand(600.0,8000.0),exprand(600.0,8000.0),t)
  ;var a = SinOsc.ar(Decay2.ar(i,0.05,0.5,-0.9*f,f))
  ;var l = Line.kr(1.0.rand2,1.0.rand2,t)
  ;var j = XLine.kr(exprand(0.01,0.5),exprand(0.01,0.5),t)
  ;Pan2.ar(Decay2.ar(i * j,0.01,0.2,a),l)}
;var pp_f =
  {arg z
  ;4.do({z = AllpassN.ar(z, 0.1, [0.05.rand,0.05.rand], 4)})
  ;z}
;Texture.overlap(gen_f, postProcess:pp_f, sustainTime:10, transitionTime:1, overlap:8))

