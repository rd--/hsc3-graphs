;; generating melodic runs, line ; https://github.com/cianoc/supercollider_fragments
SinOsc(Latch(LfSaw(Line(0.1, 20, 60, 0), 0) * 500 + 600, Impulse(10, 0)), 0) * 0.1
