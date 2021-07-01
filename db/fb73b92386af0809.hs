-- lfGauss ; modulating width, freq=60Hz
let w = xLine kr 0.1 0.001 10 DoNothing
in lfGauss ar (1 / 60) w 0 Loop DoNothing * 0.2
