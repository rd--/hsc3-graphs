-- MiVerb ; reverb time (> 1)
let freq = lfNoise0Id 'α' kr 0.3 `in_range` (400, 2500)
    input = rlpf (impulse ar 0.3 0) freq 0.1
    time = lfNoise2Id 'β' kr 0.3 * 0.1 + 1.03 -- modulate rev time above and below 1.0!
    damp = lfNoise2Id 'γ' kr 0.2 `in_range` (0, 0.7)
in X.miVerb time 0.9 damp 0.1 0 0.625 input * 0.25
