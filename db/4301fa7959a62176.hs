-- iEnvGen ; index with amplitude of input ; control freq of SinOsc
let e = envXyc [(0, 330, EnvExp), (0.5, 440, EnvExp), (1.0, 1760, EnvLin)]
    pt = amplitude ar (soundIn 0) 0.01 0.2
in sinOsc ar (iEnvGen kr pt e) 0 * 0.2
