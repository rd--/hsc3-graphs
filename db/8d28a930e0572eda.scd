// Mix ; phase-shifting ; mouseX delay control
{Mix(
 [SinOsc.ar([440,441],[0,pi]) * 0.1
 ,DelayN.ar(SinOsc.ar([440,441],[pi,0]),ControlDur.ir*2,MouseX.kr(0,ControlDur.ir*2)) * 0.1])}
