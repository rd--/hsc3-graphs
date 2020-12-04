-- fft ; local buffer allocating variant
let s0 = sinOsc KR 0.08 0 * 6 + 6.2
    s1 = sinOsc KR (squared s0) 0 * 100 + 800
    s2 = sinOsc AR s1 0
in ifft (ffta 'α' 2048 s2 0.5 0 1 0) 0 0 * 0.1
