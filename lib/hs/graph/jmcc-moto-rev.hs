-- moto rev (jmcc) #1
let f = sinOsc KR 0.2 0 * 10 + 21
    s = lfPulse AR f (mce2 0 0.1) 0.1
in clip2 (rlpf s 100 0.1) 0.4
