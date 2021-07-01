-- miElements ; strike input ; playing chords ; model=2=Strings
let inp = decay (dustId 'α' ar 1) 0.01
    g = lfNoise1Id 'β' kr 0.1 * 0.5 + 0.5
in X.miElements ar 0 inp 0 {-pit-} 53 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 {-geom-} g {-bright-} 0.5 {-damp-} 0.9 0.2 0.3 {-model-} 2 0
