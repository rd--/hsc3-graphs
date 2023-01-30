;; pink noise, frequencies emerge ; https://github.com/cianoc/supercollider_fragments
Rlpf(PinkNoise() * 0.3, { LfNoise0(12) } ! 2 * 500 + 500, 0.2)
