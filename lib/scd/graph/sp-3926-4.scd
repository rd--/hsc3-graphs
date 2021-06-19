// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; event control
// https://core.ac.uk/download/pdf/297014559.pdf
{var evt = REvent.voicer(numVoices: 16, voiceFunc:
 {arg e, c
 ;{var width = e.x.clip(0.05,0.95)
  ;var freq = e.y * 800 + 200
  ;var saw = LFSaw.ar(freq: freq / 2, iphase: 1).linlin(inMin: -1, inMax: 1, outMin: width.neg, outMax: 1 - width)
  ;var trig = ToggleFF.ar(trig: Trig.ar(in: saw.neg, dur: 2 / SampleRate.ir) + Trig.ar(in: saw, dur: 2 / SampleRate.ir))
  ;var a = saw.linlin(inMin: width.neg, inMax: 0, outMin: 0, outMax: pi).sin
  ;var b = saw.linlin(inMin: 0, inMax: 1 - width, outMin: 0, outMax: 2pi).sin
  ;Select.ar(which: trig, array: [b,a]).dup * e.w * e.z}})
;Mix.ar(evt) * 0.2}

// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; mouse control
{var width = MouseX.kr().clip(0.05,0.95)
;var freq = MouseY.kr(200, 1000)
;var saw = LFSaw.ar(freq/2, 1).linlin(-1,1, width.neg, 1-width)
;var trig = ToggleFF.ar(Trig.ar(saw.neg, 2/SampleRate.ir)+Trig.ar(saw, 2/SampleRate.ir))
;var a = saw.linlin(width.neg, 0, 0, pi).sin
;var b = saw.linlin(0, 1-width, 0, 2pi).sin
;Select.ar(trig, [b,a]).dup*0.2}

// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/7 ; sp ; mouse control
{arg buf = 10
;var width = MouseX.kr().clip(0.1,0.9)
;var freq = MouseY.kr(200, 1000)
;var sawLin = LFSaw.ar(freq/2, 1).linlin(-1,1, width.neg, 1-width)
;var saw = sawLin.bilin(0, width.neg, 1-width, 0, -0.5, 1)
;var sine = (Select.ar(saw>0, [0.5+saw, saw])*2pi).sin
;var shaper = Shaper.ar(buf, sine, 0.5)
;Pan2.ar(shaper, 0, 0.1)}

//---- allocate buffer
b = Buffer.new(server: s, numFrames: 512, numChannels: 1, bufnum: 10);
s.sendBundle(nil,b.allocMsg,b.chebyMsg([1,0,1,1,0,1]));
