// LFO modulation of Pulse waves and resonant filters
play({
    CombL.ar(
        RLPF.ar(LFPulse.ar(FSinOsc.kr(0.05,0,80,160),0,0.4,0.05),
           FSinOsc.kr([0.6,0.7],0,3600,4000), 0.2),
        0.3, [0.2,0.25], 2)
})

{var o = FSinOsc.kr(0.05,0,80,160)
;var p = FSinOsc.kr([0.6,0.7],0,3600,4000)
;var s = RLPF.ar(LFPulse.ar(o,0,0.4,0.05),p,0.2)
;Out.ar(0,CombL.ar(s,0.3,[0.2,0.25],2))}.play
