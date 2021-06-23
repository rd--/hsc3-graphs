// RDelaySet - delay memory is allocated with rtalloc, adjust to observe allocation failure
{var d = 10
;s = ar(SinOsc,kr(MouseX,110,660,0,0.1),0,kr(MouseY,0,0.6))
;[s,ar(RDelaySet,s,[d,1,1/5])]}
