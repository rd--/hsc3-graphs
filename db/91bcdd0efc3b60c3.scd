// Vibrato
{x=MouseX.kr(2.0,100.0)
;y=MouseY.kr(0.0,1.0)
;v=Vibrato.ar(DC.ar(400.0),x,0.1,1.0,1.0,y,0.1)
;SinOsc.ar(v)}
