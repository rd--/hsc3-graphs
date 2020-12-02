-- lfCub ; c.f. lfPar
let g f = f AR (f KR (f KR 0.2 0 * 8 + 10) 0 * 400 + 800) 0 * 0.1 in mce2 (g lfCub) (g lfPar)
