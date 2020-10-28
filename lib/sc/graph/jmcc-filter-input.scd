// filter input (jmcc) #5
{var rQ = MouseY.kr(0.01, 1, 'exponential') // bandwidth ratio = 1/Q
;var i = SoundIn.ar([0,1], 0.4 * rQ.sqrt) // attenuate to offset resonance
;var cf = MouseX.kr(100, 12000, 'exponential') // mouse x controls cutoff freq
;RLPF.ar(i,cf,rQ)}.play
