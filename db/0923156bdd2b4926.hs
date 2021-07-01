-- klang
let s = klangSpec_mce (X.rRandN 12 600 1000) (mceConst 12 1) (mceConst 12 0)
in klang ar 1 0 s * 0.02
