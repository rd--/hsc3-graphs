-- lorenzL ; randomly modulate params
let n e = lfNoise0 e KR 0.5
    n0 = mul_add (n 'α') 2 10
    n1 = mul_add (n 'β') 20 38
    n2 = mul_add (n 'γ') 1.5 2
in lorenzL AR sampleRate n0 n1 n2 0.05 0.1 0 0 * 0.2
