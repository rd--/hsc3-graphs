{- Formlet ; bass percussion -}
let tr = Impulse(1, 0.5);
Formlet(tr, TRand(30, 50, tr), TRand(0.01, 0.2, tr), 2)
