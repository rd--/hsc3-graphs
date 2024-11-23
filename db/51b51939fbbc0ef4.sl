/* Generating melodic runs, line in place of mouse */
SinOsc(Latch(LfSaw(Line(0.1, 20, 60), 0) * 500 + 600, Impulse(10, 0)), 0) * 0.1
