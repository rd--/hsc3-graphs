;; random drones ; https://github.com/cianoc/supercollider_fragments
{ RingzBank(PinkNoise() * 0.0005, { ExpRand(60, 10000) } ! 15, [1], [1]) } ! 2
