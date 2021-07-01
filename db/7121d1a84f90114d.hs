-- vDiskIn
let b = control kr "buf" 0
    nc = 2
in vDiskIn nc 0 (sinOsc kr 0.25 0 * 0.25 + 1) Loop 0
