// ring modulate input (jmcc) #5
{var input = SoundIn.ar([0,1])
;var x = MouseX.kr(10,4000,'exponential') // mouse x controls ring mod freq
;var modulator = SinOsc.ar(x,[0,0.5 * pi]) // offset phase of one osc by 90 degrees
;input * modulator}
