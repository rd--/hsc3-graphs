-- k2a
let freq = (mouseX kr 0.1 40 Exponential 0.2) / blockSize * sampleRate;
    o1 = k2a (lfNoise0Id 'α' kr freq)
    o2 = lfNoise0Id 'β' ar freq
in mce2 o1 o2 * 0.1
