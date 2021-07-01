-- lorenzL ; randomly modulate params
let nId e = lfNoise0Id e kr 0.5
    n0 = mul_add (nId 'α') 2 10
    n1 = mul_add (nId 'β') 20 38
    n2 = mul_add (nId 'γ') 1.5 2
in lorenzL ar sampleRate n0 n1 n2 0.05 0.1 0 0 * 0.2
