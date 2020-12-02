-- lfGauss ; very small width approach dirac function
let w = sampleDur * mouseX KR 10 3000 Exponential 0.2
in lfGauss AR 0.01 w 0 Loop DoNothing * 0.2
