-- duty ; fixed number of sample impulses ; https://fredrikolofsson.com/f0blog/impulse-train/
let dur = 1
    num = 8
in duty ar (dseqId 'α' dinf (mce [sampleDur, dur / num - sampleDur])) 0 DoNothing (dseqId 'β' num (mce [1, 0]))
