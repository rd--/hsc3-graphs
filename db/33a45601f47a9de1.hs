-- lfCub ; c.f. sinOsc
let g f = f ar (f kr (f kr 0.2 0 * 8 + 10) 0 * 400 + 800) 0 * 0.1 in mce2 (g lfCub) (g sinOsc)
