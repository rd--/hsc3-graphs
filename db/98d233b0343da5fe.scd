// pkt 00 (f0) - http://www.fredrikolofsson.com/f0blog/?q=node/490 ; requires=keywords
{var f0 = [100,200,300] + SinOsc.ar(freq: [0.11,0.22,0.33], phase: 0)
;var ph0 = SinOsc.ar(freq: [0.1,0.2,0.3], phase: 0, mul: 2 * pi)
;var a0 = 0.1 + SinOsc.ar(freq: [0.01,0.02,0.03], phase: 0, mul: 0.05)
;var i = SinOsc.ar(freq: f0, phase: ph0, mul: a0)
;var w = SinOsc.ar(freq: SinOsc.ar(freq: SinOsc.ar(freq: 0.13, phase: 0, mul: 5, add: 6), phase: 0, mul: 8, add: 50), phase: 0, mul: 1, add: 1)
;var s = Splay.ar(inArray: i, spread: w, level: 0.7, center: SinOsc.ar(freq: 1.2, phase: 0, mul: 0.6), levelComp: true)
;GVerb.ar(in: s, roomsize: 20, revtime: 5, damping: 1, inputbw: 0.5, spread: 25, drylevel: 0, earlyreflevel: 1, taillevel: 1, maxroomsize: 300)}
