-- fbSineC ; randomly modulate parameters
let x = mouseX KR 1 12 Linear 0.1
    n e = lfNoise2 e KR x
    n0 = n 'α' * 10000 + 10000
    n1 = n 'β' * 32 + 33
    n2 = n 'γ' * 0.5
    n3 = n 'δ' * 0.05 + 1.05
    n4 = n 'ε' * 0.3 + 0.3
in fbSineC AR n0 n1 n2 n3 n4 0.1 0.1 * 0.1
