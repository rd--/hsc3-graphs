// RDelaySet - three one second delays
{var s = ar(SinOsc,kr(MouseX,110,660,0,0.1),0,kr(MouseY,0,0.6))
;var d = ar(RDelaySet,s,[1,1,1/5,2,1/2,1/10,3,1/3,1/15])
;[s,d]}
