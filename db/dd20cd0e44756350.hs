-- miElements ; blow
let mod1 = lfNoise1 'α' KR 0.4 * 0.5 + 0.5
    mod2 = lfNoise1 'β' KR 0.2 * 0.5 + 0.5
    pit = range 32 44 (lfNoise0 'γ' KR 0.1)
in X.miElements AR 0 0 1 pit 0.5 0.5 0 0.6 0 mod1 0.5 0.5 mod2 0.5 0.25 0.5 0.7 0.2 0.3 0 0 * 0.2