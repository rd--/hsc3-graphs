/* https://scsynth.org/t/insect-ambience/94/ (dcm) ; backgrdhiss ; requires=kr */
{
	Hpf(Crackle(1.96), 900) * Vibrato(50.0, 1, 0.02, 0, 0, 0.04, 0.1, 0, 0).kr * 0.0001
} ! 2
