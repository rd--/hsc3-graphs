// RFreezer ; event control
{var voiceFunc =
 {arg e
 ;var buf=10,left=0,right=1,gain=1,incr=1,incrOff=0,incrRand=0,rightRand=0.1,phaseSync=0,phaseRand=1,numLp=4
 ;RFreezer.ar(buf,e.x * 0.75,e.x * (0.75 + (e.y * 0.1)),e.y,[incr * (1 - e.z),incr * (1 - e.rx)],incrOff,incrRand,rightRand + (e.y * 0.1),phaseSync,phaseRand,numLp) * e.z * e.w}
;Mix.ar(REvent.voicer(numVoices: 16, voiceFunc: voiceFunc))}
