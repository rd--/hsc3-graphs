-- lfGauss ; modulating width, freq=60Hz
let w = xLine KR 0.1 0.001 10 DoNothing
in lfGauss AR (1 / 60) w 0 Loop DoNothing * 0.2
