-- miElements ; bow
let pit = iRand 'α' 32 44
    bow_timb = lfNoise1 'β' KR 0.3 * 0.5 + 0.5
in X.miElements AR 0 0 1 pit 0.5 0.5 1 0 0 0.5 0.5 bow_timb 0.5 0.5 0.25 0.5 0.7 0.2 0.3 0 0 * 0.25
