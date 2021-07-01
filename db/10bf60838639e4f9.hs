-- dynKlang ; dynamic frequency modulation
let f = mce3 800 1000 1200 + sinOsc kr (mce3 2 3 4.2) 0 * mce3 13 24 12
    a = mce3 0.3 0.3 0.3
    p = mce3 pi pi pi
in dynKlang ar 1 0 (klangSpec_mce f a p) * 0.1
