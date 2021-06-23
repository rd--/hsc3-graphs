// RDelayMap ; event control
{var voiceFunc =
 {arg e
 ;var b = LocalBuf.new(2 * 48000,1).clear
 ;var a = [-1,e.y,0,0.5,1.5,-1,0,1]
 ;var f = (e.x * 24 + 48).midicps
 ;var o = SinOsc.ar(f,0) * e.z * Lag.kr(e.w, 5)
 ;[RDelayMap.ar(b,o,0,a),o]}
;Mix.ar(REvent.voicer(numVoices: 16, voiceFunc: voiceFunc))}
