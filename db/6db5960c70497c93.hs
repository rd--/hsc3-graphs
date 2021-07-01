-- lfGauss ; very small width approach dirac function
let w = sampleDur * mouseX kr 10 3000 Exponential 0.2
in lfGauss ar 0.01 w 0 Loop DoNothing * 0.2
