;; generating melodic runs ; https://github.com/cianoc/supercollider_fragments
SinOsc(Latch(LfSaw(MouseX(0.1, 20, 0, 0.2), 0) * 500 + 600, Impulse(10, 0)), 0) * 0.1
