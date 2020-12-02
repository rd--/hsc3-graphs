-- demandEnvGen ; frequency ramp, exponential curve
let l = dseq 'α' dinf (mce2 440 9600)
    y = mouseY KR 0.01 3 Exponential 0.2
    s = env_curve_shape EnvExp
    f = demandEnvGen AR l y s 0 1 1 1 0 1 DoNothing
in sinOsc AR f 0 * 0.1
