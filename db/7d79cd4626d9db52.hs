-- lfdClipNoise ; for fast x lfClipNoise frequently seems stuck, lfdClipNoise changes smoothly ; id
let x = mouseX kr 0.1 1000 Exponential 0.2
    n = lfdClipNoiseId 'α' ar x
in sinOsc ar (n * 200 + 500) 0 * 0.05
