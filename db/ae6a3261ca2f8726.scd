// tw 0045 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/537
{var a = SinOsc
;var f = a.ar(a.ar(0.11,0,1,0),0,1,0)
;var p_f = a.ar(95*a.ar(0.01,0,1,1),0,a.ar(0.005,0,50,0),100)
;var p = a.ar(p_f,a.ar([98,97],0,1,0),pi+a.ar(0.0005,0,1,0),0)
;a.ar(f,p,1,0).tanh * 0.1}