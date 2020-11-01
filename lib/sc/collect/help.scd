// Balance2
{Balance2.ar(LFSaw.ar(44),Pulse.ar(33),FSinOsc.kr(0.5),0.1)}.play

// Balance2
{var o=SinOsc.ar([440,550]);Balance2.ar(o[0],o[1],LFNoise0.kr(4),0.3)}.play

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,0.2*Balance2.ar(o,o,SinOsc.kr(0.2)))}.play

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,SinOsc.kr(0.2),0.2))}.play

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,MouseX.kr(-1,1),0.2))}.play

// SinOscFB
{SinOscFB.ar([400,301],MouseX.kr(0,4))*0.1}

// SinOscFB
{var y = MouseY.kr(10,1000,'exponential')
;var x = MouseX.kr(0.5pi,pi)
;SinOscFB.ar(y,x) * 0.1}

// SinOscFB
{var y = MouseY.kr(1,1000,'exponential')
;var x = MouseX.kr(0.5pi,pi)
;SinOscFB.ar(100 * SinOscFB.ar(y)+200,x) * 0.1}
