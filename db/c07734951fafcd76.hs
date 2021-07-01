-- ampComp ; in frequency modulation
let freq1 = mouseX kr 300 15000 Exponential 0.2
    freq2 = freq1 * (sinOsc ar (mouseY kr 3 200 Exponential 0.2) 0 * 0.5 + 1)
in sinOsc ar freq2 0 * 0.1 * ampComp ar freq2 300 0.3333
