;; saw as an lfo ; https://github.com/cianoc/supercollider_fragments
var lfo = LfSaw(2, 0) * -100 + 600;
SinOsc(lfo, 0) * 0.1
