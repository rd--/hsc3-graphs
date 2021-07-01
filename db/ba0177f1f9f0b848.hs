-- bpf
let n = whiteNoiseId 'α' ar
    x = mouseX kr 220 440 Exponential 0.1
    y = mouseY kr 0.01 0.2 Linear 0.1
in bpf n (mce [x, 550 - x]) y
