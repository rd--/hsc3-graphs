-- formant ; modulate fundamental frequency, formant frequency stays constant
formant ar (xLine kr 400 1000 8 RemoveSynth) 2000 800 * 0.125
