-- miElements ; basic ; model=0=Modal
let inp = pinkNoise 'α' AR * 0.3
    gat = lfPulse KR 2 0 0.5
in X.miElements AR {-blow_in-} inp 0 gat 45 0.5 0.2 0 0 0 0.5 0.5 0.5 0.5 0.5 0.25 0.5 0.7 0.2 0.3 {-model-} 0 0
