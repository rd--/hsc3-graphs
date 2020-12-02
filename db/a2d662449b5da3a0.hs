-- lfGauss ; modulating duration
let d = xLine KR 0.1 0.001 10 DoNothing
in lfGauss AR d 0.03 0 Loop DoNothing * 0.2
