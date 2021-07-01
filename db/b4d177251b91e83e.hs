-- lfGauss ; modulating duration
let d = xLine kr 0.1 0.001 10 DoNothing
in lfGauss ar d 0.03 0 Loop DoNothing * 0.2
