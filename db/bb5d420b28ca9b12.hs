-- vDiskIn
let b = control KR "buf" 0
    nc = 2
in vDiskIn nc 0 (sinOsc KR 0.25 0 * 0.25 + 1) Loop 0
