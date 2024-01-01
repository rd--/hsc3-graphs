var freq = MouseX(300, 15000, 1, 0.2);
Pulse(freq, 0.5) * 0.1 * AmpComp(freq, 300, 4 / 3).kr
