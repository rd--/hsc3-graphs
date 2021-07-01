-- MiBraids ; scanning
let timb = lfNoise1Id 'α' kr 0.3 * 0.5 + 0.5
    color = lfNoise1Id 'β' kr 0.3 * 0.5 + 0.5
    pit = mouseY kr 33 73 Linear 0.2
    model = mouseX kr 0 47 Linear 0.2
in X.miBraids ar pit timb color model 0 0 0 0 0 * 0.1
