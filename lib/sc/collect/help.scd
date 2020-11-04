// Balance2
{Balance2.ar(LFSaw.ar(44),Pulse.ar(33),FSinOsc.kr(0.5),0.1)}

// Balance2
{var o=SinOsc.ar([440,550]);Balance2.ar(o[0],o[1],LFNoise0.kr(4),0.3)}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,0.2*Balance2.ar(o,o,SinOsc.kr(0.2)))}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,SinOsc.kr(0.2),0.2))}

// Balance2
{var o=SinOsc.ar(440);Out.ar(0,Balance2.ar(o,o,MouseX.kr(-1,1),0.2))}

// CrossoverDistortion
{CrossoverDistortion.ar(SinOsc.ar([400, 404], 0, 0.2), MouseX.kr(0, 1), MouseY.kr(0, 1))}

// CrossoverDistortion
{CrossoverDistortion.ar(SoundIn.ar, MouseX.kr(0, 1), MouseY.kr(0, 1))}

// FreqShift
{var a = Blip.ar(60,4,LFGauss.ar(4,1/8))
;var b = a / 4 + LocalIn.ar(2)
;var c = FreqShift.ar(b,LFNoise0.kr(1/4,90))
;LocalOut.ar(DelayC.ar(c,1,0.1,0.9))
;c}

// Klang
{Klang.ar(`[[800,1000,1200],[0.3,0.3,0.3],[pi,pi,pi]],1,0)*0.4}

// Klang
{Klang.ar(`[[800,1000,1200],nil,nil],1,0)*0.25}

// Klang
{Klang.ar(`[Array.rand(12,600.0,1000.0),nil,nil],1,0)*0.05}

// LinExp
{var mod = SinOsc.kr(Line.kr(1, 10, 10))
;[SinOsc.ar(mod * 400 + 500),SinOsc.ar(LinExp.kr(mod, -1,1, 100, 900))] * 0.1}

// LinXFade2
{LinXFade2.ar(FSinOsc.ar(800, 0, 0.2), PinkNoise.ar(0.2), FSinOsc.kr(1))}

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

// SineShaper
{SineShaper.ar(SinOsc.ar([400, 404], 0, 0.2), MouseX.kr(0, 1))}

// SineShaper
{SineShaper.ar(SoundIn.ar, MouseX.kr(0, 1))}

// Summer
{SinOsc.ar(Summer.kr(Impulse.kr(5), 1.5, 0, 0).poll * 100, 0, 0.1)}

// Summer
{var trig = Dust.kr(5)
;var reset = Impulse.kr(0.5)
;SinOsc.ar(Summer.kr(trig, [0.5, 0.25], reset, 1) * 100, 0, 0.1)}

// Vibrato
{SinOsc.ar(Vibrato.ar(DC.ar(400.0),1,0.02))*0.1}

// Vibrato
{SinOsc.ar(Vibrato.kr(400.0,1,0.02))}

// Vibrato
{x=MouseX.kr(2.0,100.0)
;y=MouseY.kr(0.0,1.0)
;v=Vibrato.ar(DC.ar(400.0),x,0.1,1.0,1.0,y,0.1)
;SinOsc.ar(v)}

// Vibrato
{n=LFNoise1.kr(1,3,7)
;x=MouseX.kr(0.0,1.0)
;y=MouseY.kr(0.0,1.0)
;v=Vibrato.ar(DC.ar(400.0),n,x,1.0,1.0,y,0.1)
;SinOsc.ar(v)}
