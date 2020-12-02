-- ampComp ; in frequency modulation
let freq1 = mouseX KR 300 15000 Exponential 0.2
    freq2 = freq1 * (sinOsc AR (mouseY KR 3 200 Exponential 0.2) 0 * 0.5 + 1)
in sinOsc AR freq2 0 * 0.1 * ampComp AR freq2 300 0.3333