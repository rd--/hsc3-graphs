-- fbSineC ; randomly modulate parameters
let x = mouseX kr 1 12 Linear 0.1
    nId e = lfNoise2Id e kr x
    n0 = nId 'α' * 10000 + 10000
    n1 = nId 'β' * 32 + 33
    n2 = nId 'γ' * 0.5
    n3 = nId 'δ' * 0.05 + 1.05
    n4 = nId 'ε' * 0.3 + 0.3
in fbSineC ar n0 n1 n2 n3 n4 0.1 0.1 * 0.1
