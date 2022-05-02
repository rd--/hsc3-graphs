// analog bubbles (jmcc) #1
var o = LFSaw.kr(#[8, 7.23], 0) * 3 + 80;
var f = LFSaw.kr(0.4, 0) * 24 + o; // glissando function
var s = SinOsc.ar(f.midicps, 0) * 0.04;
CombN.ar(s, 0.2, 0.2, 4) * 0.1 // echoing sine wave

//---- analog bubbles (jmcc) #1 ; keywords
var o = LFSaw.kr(freq: #[8, 7.23], iphase: 0) * 3 + 80;
var f = LFSaw.kr(freq: 0.4, iphase: 0) * 24 + o; // glissando function
var s = SinOsc.ar(freq: f.midiCps, phase: 0) * 0.04;
CombN.ar(in: s, maxdelaytime: 0.2, delaytime: 0.2, decaytime: 4) * 0.1 // echoing sine wave
