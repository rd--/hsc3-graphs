-- lfCub ; c.f. lfPar
let g f = f AR (xLine KR 100 8000 30 DoNothing) 0 * 0.1 in mce2 (g lfCub) (g lfPar)
