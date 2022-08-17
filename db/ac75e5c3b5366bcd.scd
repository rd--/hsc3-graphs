//--tweet0330
a=SinOsc;GVerb.ar(FreqShift.ar(c=a.ar([2,3]/8)%0.5,a.ar(1/[9,5]).round(c>0.125)+1*[3,2]*99).tanh/2,200,9,1,1,9,1,0.1)
