// filter input (jmcc) #5

play({
    var rQ = MouseY.kr(0.01, 1, 'exponential'); // bandwidth ratio = 1/Q
    RLPF.ar(
        SoundIn.ar([0,1], 0.4 * rQ.sqrt), // attenuate to offset resonance
        MouseX.kr(100, 12000, 'exponential'), // mouse x controls cutoff freq
        rQ
    )
})
