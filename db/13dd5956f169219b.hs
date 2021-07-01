-- miElements ; blow
let mod1 = lfNoise1Id 'α' kr 0.4 * 0.5 + 0.5
    mod2 = lfNoise1Id 'β' kr 0.2 * 0.5 + 0.5
    pit = lfNoise0Id 'γ' kr 0.1 `in_range` (32,44)
in X.miElements ar 0 0 1 pit 0.5 0.5 0 0.6 0 mod1 0.5 0.5 mod2 0.5 0.25 0.5 0.7 0.2 0.3 0 0 * 0.2
