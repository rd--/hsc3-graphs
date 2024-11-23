/* Lasers ; requires=kr */
SinOsc(Adsr(Dust(1), 0.1, 0.4, 0.8, 0.5, [-4]).kr * 10000, 0) * 0.1
