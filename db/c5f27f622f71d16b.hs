-- iEnvGen ; index with amplitude of input ; control freq of SinOsc
let e = envXYC [(0, 330, EnvExp), (0.5, 440, EnvExp), (1.0, 1760, EnvLin)]
    pt = amplitude AR (soundIn 0) 0.01 0.2
in sinOsc AR (iEnvGen KR pt e) 0 * 0.2
