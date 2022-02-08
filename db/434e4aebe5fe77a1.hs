-- envGen ; impulse train with curvature ; see below for control messages ; https://fredrikolofsson.com/f0blog/impulse-train/
let go = trigControl "go" 1 -- trigger
    dur = control kr "dur" 1 -- total duration in seconds (also frequency)
    cur = control kr "cur" 0 -- curvature or 'shape'. 0 = pulses at regular intervals
    num = control kr "num" 8 -- number of impulses per duration
    amp = control kr "amp" 1 -- gain
    env = envGen ar go 1 0 1 DoNothing (envelope [0, 0, 1] [0, dur] [EnvNum cur])
in changed (ceil (env * num)) 0 * amp
