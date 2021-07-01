-- demandEnvGen ; frequency ramp, exponential curve
let l = dseqId 'α' dinf (mce2 440 9600)
    y = mouseY kr 0.01 3 Exponential 0.2
    s = env_curve_shape EnvExp
    f = demandEnvGen ar l y s 0 1 1 1 0 1 DoNothing
in sinOsc ar f 0 * 0.1
