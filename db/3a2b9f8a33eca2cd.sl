;; random sine waves ; https://github.com/cianoc/supercollider_fragments
{ Pan2(SinOsc(SinOsc(1 / 10, 6.Rand) * 200 + 600, 0), 1.Rand, 0.05) } !+ 15