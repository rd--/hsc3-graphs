-- miElements ; bow
let pit = iRandId 'α' 32 44
    bow_timb = lfNoise1Id 'β' kr 0.3 * 0.5 + 0.5
in X.miElements ar 0 0 1 pit 0.5 0.5 1 0 0 0.5 0.5 bow_timb 0.5 0.5 0.25 0.5 0.7 0.2 0.3 0 0 * 0.25
