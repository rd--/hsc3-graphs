// nv https://swiki.hfbk-hamburg.de/MusicTechnology/899
{var s = LocalIn.ar(2, 0) * 7.5 + (Saw.ar(#[32, 33]) * 0.2)
;var f = 2 ** (LFNoise0.kr(4 / 3) * 4) * 300
;var a = CombN.ar(BPF.ar(s, f, 0.1).distort, 2, 2, 40)
;LocalOut.ar(a)
;a}

//---- nv https://swiki.hfbk-hamburg.de/MusicTechnology/899
{var s = LocalIn.ar(numChannels: 2, default: 0) * 7.5 + Saw.ar(freq: #[32, 33], mul: 0.2)
;var f = 2 ** LFNoise0.kr(freq: 4/3, mul: 4) * 300
;var a = CombN.ar(in: BPF.ar(in: s, freq: f, rq: 0.1).distort, maxdelaytime: 2, delaytime: 2, decaytime: 40)
;LocalOut.ar(channelsArray: a)
;a}

//---- nv https://swiki.hfbk-hamburg.de/MusicTechnology/899
{LocalOut.ar(a=CombN.ar(BPF.ar(LocalIn.ar(2)*7.5+Saw.ar([32,33],0.2),2**LFNoise0.kr(4/3,4)*300,0.1).distort,2,2,40));a}
