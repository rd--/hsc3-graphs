-- iEnvGen ; using line to generate time signal ; ie. time can move faster and start near the end
let param = envPairs [(0,110),(4,220),(9,440),(11,220),(13,880),(19,110),(23,55),(27,55)] EnvExp
    (start,end,scale) = (11,27,1.5)
    time = line kr start end ((end - start) / scale) DoNothing
    freq = iEnvGen kr time param
    print_time = poll (impulse kr 1 0) time 0 (label "time")
    print_freq = poll (impulse kr 1 0) freq 0 (label "freq")
in mrg [pan2 (sinOsc ar 220 0 + sinOsc ar freq 0) 0 0.1,print_time,print_freq]
